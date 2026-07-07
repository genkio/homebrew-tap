class Vidgrep < Formula
  desc "Natural-language scene search and clipping for local video files"
  homepage "https://github.com/genkio/vidgrep"
  url "https://github.com/genkio/vidgrep/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "29629ff1b67e5393dcb3442906234a4192a483aef753a663f5c4e07164f3ed4a"
  license "MIT"

  depends_on "ffmpeg"
  depends_on "python@3.13"

  def install
    python = Formula["python@3.13"].opt_bin/"python3.13"
    venv = libexec/"venv"
    system python, "-m", "venv", venv
    # deps resolved from PyPI at install time; torch & friends are too big to vendor as resources
    system venv/"bin/pip", "install", "--quiet", buildpath.to_s
    # torchvision arm64 wheels lack an rpath to torch's bundled dylibs -> "operator torchvision::nms does not exist"
    Dir[venv/"lib/python3.13/site-packages/torchvision/*.so"].each do |so|
      system "install_name_tool", "-add_rpath", "@loader_path/../torch/lib", so
      system "codesign", "--force", "--sign", "-", so
    end
    bin.install_symlink venv/"bin/vidgrep"
  end

  test do
    assert_match "usage: vidgrep", shell_output("#{bin}/vidgrep --help")
  end
end
