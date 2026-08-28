class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.20.0/tui_0.20.0_darwin_arm64.tar.gz"
      sha256 "b68f44b167d63787f676f9ce522f16a1c1fdfc500e6bf8ad1335322c8a63b331"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.20.0/tui_0.20.0_darwin_amd64.tar.gz"
      sha256 "e750055aa21b0226760204eaf1dfce7c2b2ef443057bb239cccd0cd6574479f0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.20.0/tui_0.20.0_linux_arm64.tar.gz"
      sha256 "1817bda9b3931a537afb378837419c67f8e2c50f147d90b51f95ef09a43b5520"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.20.0/tui_0.20.0_linux_amd64.tar.gz"
      sha256 "a5da3dc7b248500825c83db02b71cb619e7068aae701b634548b1602a91c85ae"
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
