class Vidgrep < Formula
  desc "Natural-language scene search and clipping for local video files"
  homepage "https://github.com/genkio/vidgrep"
  url "https://github.com/genkio/vidgrep/archive/refs/tags/v0.5.6.tar.gz"
  sha256 "16235e67ee6f15b9e8397e764dedaa2f38de546251ebe35608e99a75b902f501"
  license "MIT"

  # keep the @rpath dylib id we set below instead of rewriting it to a long absolute path
  # that doesn't fit the vendored sqlite-vec dylib's header
  preserve_rpath

  depends_on "ffmpeg"
  depends_on "python@3.13"

  def install
    python = Formula["python@3.13"].opt_bin/"python3.13"
    venv = libexec/"venv"
    system python, "-m", "venv", venv
    # PyTorch ships no Intel-macOS wheels, so Intel installs the torch-free core (search + cut
    # via an exported ONNX encoder); Apple Silicon gets the full indexing stack.
    target = Hardware::CPU.arm? ? "#{buildpath}[index]" : buildpath.to_s
    system venv/"bin/pip", "install", "--quiet", target
    # sqlite-vec's wheel ships vec0.dylib with a relative id and no header padding; giving it an
    # @rpath id makes Homebrew skip the relocation that otherwise fails on Intel (loaded by path)
    Dir[venv/"lib/python3.13/site-packages/sqlite_vec/vec0.dylib"].each do |dylib|
      system "install_name_tool", "-id", "@rpath/vec0.dylib", dylib
      system "codesign", "--force", "--sign", "-", dylib
    end
    if Hardware::CPU.arm?
      # torchvision arm64 wheels lack an rpath to torch's bundled dylibs -> "operator torchvision::nms does not exist"
      Dir[venv/"lib/python3.13/site-packages/torchvision/*.so"].each do |so|
        system "install_name_tool", "-add_rpath", "@loader_path/../torch/lib", so
        system "codesign", "--force", "--sign", "-", so
      end
    end
    bin.install_symlink venv/"bin/vidgrep"
  end

  test do
    assert_match "usage: vidgrep", shell_output("#{bin}/vidgrep --help")
  end
end
