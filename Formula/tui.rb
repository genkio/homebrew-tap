class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.30.0/tui_0.30.0_darwin_arm64.tar.gz"
      sha256 "75676bdd2b485d9b7f62efae1b38b09af1ec45f894598dd32e3acf979c3bbedc"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.30.0/tui_0.30.0_darwin_amd64.tar.gz"
      sha256 "644d19d3f95596729a0cad89965662096bb03cecb295df00a1150551eaf170a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.30.0/tui_0.30.0_linux_arm64.tar.gz"
      sha256 "d9a07cd27196b20b4ce78c498c2f3e25ffa5283a55b583a96334d7cba55f9964"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.30.0/tui_0.30.0_linux_amd64.tar.gz"
      sha256 "fe5c2979f21a0680e781a1317792d5a357551af9382f9a421d55523a9e82ba03"
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
