class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban, bilibili"
  homepage "https://github.com/genkio/tui"
  version "0.18.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.18.0/tui_0.18.0_darwin_arm64.tar.gz"
      sha256 "4ce2ce84f8be10e7343fa441020794b1abe4d2931b2b1bd8425e28fcfe0570c2"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.18.0/tui_0.18.0_darwin_amd64.tar.gz"
      sha256 "2c373b73f57641fa80ca28ae112d9f4797f3262ec3e87408d42ac02d6b6af616"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.18.0/tui_0.18.0_linux_arm64.tar.gz"
      sha256 "c0aeefb1b2cc1dbf74b7ed42ed724721ef701373f7a5919fd1025f17beaf8b92"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.18.0/tui_0.18.0_linux_amd64.tar.gz"
      sha256 "d7e608e66b3448caa945eeb0b87a2179d29de19c93f5f6683eff39253d66fdfc"
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
