class Vidgrep < Formula
  desc "Natural-language scene search and clipping for local video files"
  homepage "https://github.com/genkio/vidgrep"
  url "https://github.com/genkio/vidgrep/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "7a0eecc79d1976aadd089eb7f8d0b28b708ea59c02cc19097956a6acf9d454b4"
  license "MIT"

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
