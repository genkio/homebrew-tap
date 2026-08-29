class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.25.0/tui_0.25.0_darwin_arm64.tar.gz"
      sha256 "06b264fe29b686ef9296245c655e992ff829b3e218ef941b994b0c2b6b3c3e2e"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.25.0/tui_0.25.0_darwin_amd64.tar.gz"
      sha256 "20780fea447bb663adf1caeda8eb431c7634fe673291975b543b57b835927073"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.25.0/tui_0.25.0_linux_arm64.tar.gz"
      sha256 "e008e60699e1072a00d18e317ff866911b7519a827b4e68eb9fa14a5a9f722c1"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.25.0/tui_0.25.0_linux_amd64.tar.gz"
      sha256 "054d3c72bdcce5fe55f53ad53fa8604811082551c5ff2f23e88df6ae8201bb18"
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
