class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban"
  homepage "https://github.com/genkio/tui"
  version "0.10.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.10.0/tui_0.10.0_darwin_arm64.tar.gz"
      sha256 "cd4c2dd22c0d258ef01554bbe280410448ec1b2335399bc65556bff49550b4da"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.10.0/tui_0.10.0_darwin_amd64.tar.gz"
      sha256 "f58640b987d95fdea752e70b994183956eb1e0600cc0a93666a6f41efcb9e3b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.10.0/tui_0.10.0_linux_arm64.tar.gz"
      sha256 "61ad9dbd8dc2057558d1b832216e51a610bfea929ffdb86f49ef1a9641134415"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.10.0/tui_0.10.0_linux_amd64.tar.gz"
      sha256 "da4d97219ccf1752ce7988f7cc4d52fe9a7b6d18e2fd2ae69becb741935ee1da"
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
