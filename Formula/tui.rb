class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo"
  homepage "https://github.com/genkio/tui"
  version "0.1.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.1.0/tui_0.1.0_darwin_arm64.tar.gz"
      sha256 "654a467e89ffeb158b7043823f361af8b69357d19ee0d0b932cb1a3cfe647854"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.1.0/tui_0.1.0_darwin_amd64.tar.gz"
      sha256 "6457593b7811145a01bf9d8b0f58e261c47beed5bcb854b35c917212956c4db9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.1.0/tui_0.1.0_linux_arm64.tar.gz"
      sha256 "48cb2f77c0cb380f6194140e068b404283e155a14cc4ed83c0030c8af119d8bb"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.1.0/tui_0.1.0_linux_amd64.tar.gz"
      sha256 "7fcafe942eee4b6a5e7e63e73430d8ce387a066abf6387b76111a0f0b129b6f8"
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
