class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban"
  homepage "https://github.com/genkio/tui"
  version "0.7.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.7.0/tui_0.7.0_darwin_arm64.tar.gz"
      sha256 "f74d62ac94fc9c2ce94b660c3a3c4b04d28cfb059301a9f6072e45bbe50fbef4"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.7.0/tui_0.7.0_darwin_amd64.tar.gz"
      sha256 "2328084126bea81ae8462acff353cdee67be28caba74402e1b7e4561bb2ae2a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.7.0/tui_0.7.0_linux_arm64.tar.gz"
      sha256 "3d77d5c6adf5903cae4277a256b1a51a79c82bd7174a1d8b7ffca40f0bb68a12"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.7.0/tui_0.7.0_linux_amd64.tar.gz"
      sha256 "0dee063fad99ce38776de46db2dbdf64430490c18def4c9b988fcaf53f69901d"
    end
  end

  def install
    bin.install "tui"
  end

  def caveats
    <<~EOS
      Run `tui` to open the picker. Log into an app with `tui <app> --auth`
      (e.g. `tui x --auth`): it opens a Chromium-family browser (Brave, Chrome,
      Chromium, Edge, ...) to capture your session. Credentials and settings are
      stored in ~/.config/tui/env.
    EOS
  end

  test do
    assert_match "tui", shell_output("#{bin}/tui --version")
  end
end
