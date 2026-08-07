class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit"
  homepage "https://github.com/genkio/tui"
  version "0.4.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.4.0/tui_0.4.0_darwin_arm64.tar.gz"
      sha256 "485a9716b4e4cfdb195bee95c5307a87407c423a9b2ebe7491efd13fe5f20af8"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.4.0/tui_0.4.0_darwin_amd64.tar.gz"
      sha256 "d0ca95fba2a46a67c901f3e5b0ba83fd190acae2a8fe76ae402dd132afcbcda5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.4.0/tui_0.4.0_linux_arm64.tar.gz"
      sha256 "35dbf5503eb038e22ed0116bf04fe3e0964e6845d7289a5e1afa90e1617e2aaf"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.4.0/tui_0.4.0_linux_amd64.tar.gz"
      sha256 "710676015c8b10b167549bdc1bdcc0d5ffce1a0aa8988e726407937f77922e2b"
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
