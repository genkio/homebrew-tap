class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.31.0/tui_0.31.0_darwin_arm64.tar.gz"
      sha256 "0b0959ce170dc9b6aec9d72a94c4c3872329053b1b896b00bf7dbcc31ddfebba"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.31.0/tui_0.31.0_darwin_amd64.tar.gz"
      sha256 "2e28c919f3180082f13ed175ac4f07668f3c31137bbf8ff5f1400f5f2ecb3ab6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.31.0/tui_0.31.0_linux_arm64.tar.gz"
      sha256 "0c2f4c8a6ce076fb839e2e5ff8b35141c41329bfea3f5cc28adbad6df6891d85"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.31.0/tui_0.31.0_linux_amd64.tar.gz"
      sha256 "847a272b1cc417a2d9f67d35947e3e0dc9dc4b64edc54747054cb7f6b4f0e503"
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
