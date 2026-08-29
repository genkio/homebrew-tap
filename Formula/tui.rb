class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.22.0/tui_0.22.0_darwin_arm64.tar.gz"
      sha256 "6c0456c15cd6bc29ce1e94d23530a8eedc1cb9dc0b7f6b1d0ecd1546dbda255e"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.22.0/tui_0.22.0_darwin_amd64.tar.gz"
      sha256 "4eef9464d0877f994ae98eb3257eea482cb2608604e1a2b44dca71e333e299e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.22.0/tui_0.22.0_linux_arm64.tar.gz"
      sha256 "563fd9b67177e6e8f4de2652a31a79c0191df25adb2d49fc43b18c63d28f96ee"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.22.0/tui_0.22.0_linux_amd64.tar.gz"
      sha256 "8aa6c455ede06f8a2075e661ea034f78948986801280a89ad8c2bbc22681474f"
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
