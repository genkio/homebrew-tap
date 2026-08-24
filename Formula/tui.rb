class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban, bilibili"
  homepage "https://github.com/genkio/tui"
  version "0.16.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.16.0/tui_0.16.0_darwin_arm64.tar.gz"
      sha256 "86020fb5843731fd906b45f92f085bb2ef42fee0065f0dcf4108ee388c86fa74"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.16.0/tui_0.16.0_darwin_amd64.tar.gz"
      sha256 "7892e080c94c598b0021f1a27f990a3ce0585c26b8fbee453a6d84f4fd319bc1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.16.0/tui_0.16.0_linux_arm64.tar.gz"
      sha256 "9e8f983cd08884f8d198b360dbdb7d2e7bca39d581d8a4a0cf609611a781886a"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.16.0/tui_0.16.0_linux_amd64.tar.gz"
      sha256 "42faf3ac1c5a0250ffafeb45ea86409e96f5b938459223784436690c08bacb2b"
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
