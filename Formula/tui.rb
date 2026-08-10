class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban"
  homepage "https://github.com/genkio/tui"
  version "0.11.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.11.0/tui_0.11.0_darwin_arm64.tar.gz"
      sha256 "c8a2cf3c93cc63387c93fec76d87eecfb13bc6ba0c81b9977864929197951d02"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.11.0/tui_0.11.0_darwin_amd64.tar.gz"
      sha256 "8aa19f41984616335c6a3202fbc38e45cef72cc2e97579743ae93ded91f4f144"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.11.0/tui_0.11.0_linux_arm64.tar.gz"
      sha256 "48a01724094d8886279774cc38d86ce29a55e73f5e41bd5cf16a7fac9d4bf24c"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.11.0/tui_0.11.0_linux_amd64.tar.gz"
      sha256 "38f089a956039b0381c76fdbfd7611c459b0de99c16d2fc671c867f6418c8a16"
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
