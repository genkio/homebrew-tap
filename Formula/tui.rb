class Tui < Formula
  desc "SQLite-backed feed service with terminal and web clients"
  homepage "https://github.com/genkio/tui"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.27.0/tui_0.27.0_darwin_arm64.tar.gz"
      sha256 "0b26f59ee3dce415e2b1bdb63e2c2c70836d8a0e04891635b055afd9707fd57f"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.27.0/tui_0.27.0_darwin_amd64.tar.gz"
      sha256 "2e53d6d5108a9f51ffae5df1fd3d2a8aa1c660c8c09d8b36dd846e23310b03a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.27.0/tui_0.27.0_linux_arm64.tar.gz"
      sha256 "e7a9d6632c080cae3e9b6cbdb90b263195a3c047577576e98ff9f6b989bbb9ad"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.27.0/tui_0.27.0_linux_amd64.tar.gz"
      sha256 "67f0d4ea5ec7de2696a64990581ce64e3cbdaa6ac10ac143f586138ee9743eaa"
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
