class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.21.0/tui_0.21.0_darwin_arm64.tar.gz"
      sha256 "5aafcecf140c5149d92288460c96d3e74faac6724d9dcd8740e926873024f9dc"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.21.0/tui_0.21.0_darwin_amd64.tar.gz"
      sha256 "ae0f31241256456744e989097b3b0baf4c30a21b4e6d2d515edeab50e867f4a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.21.0/tui_0.21.0_linux_arm64.tar.gz"
      sha256 "80361799db9abe100ad9b2946ab3e31a85a304249c4776227fac729009222e7e"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.21.0/tui_0.21.0_linux_amd64.tar.gz"
      sha256 "8ea34fbd85ae7843628270a5e4689d40e5a5ed85dce08d8861ac856241a20cc2"
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
