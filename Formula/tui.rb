class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.28.0/tui_0.28.0_darwin_arm64.tar.gz"
      sha256 "6c7f0f818c104fcba2386a8e3e4b43294149f7927c4b3e401b5bf538ba97488d"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.28.0/tui_0.28.0_darwin_amd64.tar.gz"
      sha256 "8ee1fb1aea14bc4d2540abc8137f732f670f16a77db0c86611184c65e724254d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.28.0/tui_0.28.0_linux_arm64.tar.gz"
      sha256 "cd52266d32d4e9fbe29a5052bd5b58d14a1f74afa15f4d3ddee33bb3ce027091"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.28.0/tui_0.28.0_linux_amd64.tar.gz"
      sha256 "8dda6d3aa85667806b02df5b158a4cff4d371382c5a64e28f1e16903c4d15351"
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
