class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.26.0/tui_0.26.0_darwin_arm64.tar.gz"
      sha256 "4734772e57ebd6aa6fd3b8757864539204ef3a2bf5bbeca45eb29d28a47ce202"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.26.0/tui_0.26.0_darwin_amd64.tar.gz"
      sha256 "39c1ea671b59f85a5dd3823c3ba66300f6acb013927a9be3e5ca7da1e0474e49"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.26.0/tui_0.26.0_linux_arm64.tar.gz"
      sha256 "47dcca5111fd6c657c6279aab46329c85fcf2ce4999b34d0268eb27f67891353"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.26.0/tui_0.26.0_linux_amd64.tar.gz"
      sha256 "87649ad2e5dba3a73c26d8f3f989c245d1da540125f5609d078dc21db2880a8b"
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
