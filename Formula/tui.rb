class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.23.0/tui_0.23.0_darwin_arm64.tar.gz"
      sha256 "a0cd0a6afd75456596f4a766e852e247e7047d77a24c19e59fd0119e50e07cf3"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.23.0/tui_0.23.0_darwin_amd64.tar.gz"
      sha256 "b628bfd4c614df84fcf39d43c96dc635368fd5dde8494581bd6681e1e59539a4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.23.0/tui_0.23.0_linux_arm64.tar.gz"
      sha256 "0c758fdf508e2f4780fbcba907b339a8aa6d8c904c8bd53868d8bfec043793c4"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.23.0/tui_0.23.0_linux_amd64.tar.gz"
      sha256 "1366bf060e928874ec61c28eecd1e25f3483b9ea1c9a533ba64880bd0adb531e"
    end
  end

  def install
    bin.install "tui"
  end

  def caveats
    <<~EOS
      Start the feed service with `tui serve`, then run `tui` for the terminal
      client or `tui web` for the browser. Log into a source with
      `tui <app> --auth` (for example, `tui x --auth`). Credentials and settings
      are stored in ~/.config/tui/env unless `--sync-dir` is used.
    EOS
  end

  test do
    assert_match "tui", shell_output("#{bin}/tui --version")
  end
end
