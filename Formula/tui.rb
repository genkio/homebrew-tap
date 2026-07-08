class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo"
  homepage "https://github.com/genkio/tui"
  version "0.2.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.2.0/tui_0.2.0_darwin_arm64.tar.gz"
      sha256 "7871a3bdcfcb8e879d45255476e443dca6212c0601d71406a798cd01cd5fa0da"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.2.0/tui_0.2.0_darwin_amd64.tar.gz"
      sha256 "65339c3fa69a57efa4811242168bc452cc397b74a3db36d714a699929e861c78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.2.0/tui_0.2.0_linux_arm64.tar.gz"
      sha256 "006af5ca22b9c8ab2d315c0533742b47996cfe6c909c22116735264a02498717"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.2.0/tui_0.2.0_linux_amd64.tar.gz"
      sha256 "577739d3de1b06198bcaa10b438b982650d4bb8b0f3ec237160db32648a5949d"
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
