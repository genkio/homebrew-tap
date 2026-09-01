class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.29.0/tui_0.29.0_darwin_arm64.tar.gz"
      sha256 "6651049711d80f9b7ee7f44fd413093af32f72b2b138c34e994bf60787229796"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.29.0/tui_0.29.0_darwin_amd64.tar.gz"
      sha256 "d0479548afca23fa0274b97e9ee20ec3f7b84b9a84c4b71e680b473c84347e40"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.29.0/tui_0.29.0_linux_arm64.tar.gz"
      sha256 "0616108719edab6ee5842001d735efc47f499620522695981b95a4a4d6bc67dd"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.29.0/tui_0.29.0_linux_amd64.tar.gz"
      sha256 "ce16098bb4b3c71d68add466d83f1ef115ff6cf1a9d2cc2deb1c98748cee8fc8"
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
