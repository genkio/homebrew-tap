class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban"
  homepage "https://github.com/genkio/tui"
  version "0.13.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.13.0/tui_0.13.0_darwin_arm64.tar.gz"
      sha256 "5ae62c9f447e11a3743f465b3acd2a78e7c233b852473c305ce6c1e5c283914e"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.13.0/tui_0.13.0_darwin_amd64.tar.gz"
      sha256 "9c75501743ca51e7fe1822b0a814aee2b8d8009cdd5a87e603ebac1ae2731679"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.13.0/tui_0.13.0_linux_arm64.tar.gz"
      sha256 "3ebf9d4fc70923e09a2623dcfa7713acb313409fc006dd837c7511a4b672eee0"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.13.0/tui_0.13.0_linux_amd64.tar.gz"
      sha256 "ded345910ff17fae0855105089ecd886d40df681a649bec08599fa833fd1e659"
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
