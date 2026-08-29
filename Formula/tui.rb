class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.24.0/tui_0.24.0_darwin_arm64.tar.gz"
      sha256 "2bf3b6c673513bbfa4b5e94dd3893f4dc1a2425f512fcc36f8186f93a5c67edd"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.24.0/tui_0.24.0_darwin_amd64.tar.gz"
      sha256 "c1816f30ae9e81b81951e262431c4a2c4760618c0fe563cb98cc08a2de03c1a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.24.0/tui_0.24.0_linux_arm64.tar.gz"
      sha256 "4afa800a34fe27919f132ca811f359b9a449179743b6b4c6e80238171fd50882"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.24.0/tui_0.24.0_linux_amd64.tar.gz"
      sha256 "cdbc4c5bcac9bdfab7a9036a9882400f510426d1bab4bc8ee6de07d657888571"
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
