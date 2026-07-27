class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo"
  homepage "https://github.com/genkio/tui"
  version "0.3.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.3.0/tui_0.3.0_darwin_arm64.tar.gz"
      sha256 "b6efe7e2c12853c81a60c0c94bf2fc255d9e675bde81ce2b74316b91a98b38ad"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.3.0/tui_0.3.0_darwin_amd64.tar.gz"
      sha256 "8580392724c1bf7f9959a188e52c3f8d0cbb2a47a0a0fc681dbbf8d511e55ce9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.3.0/tui_0.3.0_linux_arm64.tar.gz"
      sha256 "701997367f1638b31f0c27112b9e695f6d069ae81fa9b9261c8cebf1719b9bed"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.3.0/tui_0.3.0_linux_amd64.tar.gz"
      sha256 "4cba48b55430a41ff975904e8b66af7b763821d4fe1a6a9a94d860dc3bb5e04a"
    end
  end

  def install
    bin.install "tui"
  end

  def caveats
    <<~EOS
      Run `tui` to open the picker. Log into an app with `tui <app> --auth`
      (e.g. `tui x --auth`): it opens a Chromium-family browser (Brave, Chrome,
      Chromium, Edge, ...) to capture your session. Credentials and settings are
      stored in ~/.config/tui/env.
    EOS
  end

  test do
    assert_match "tui", shell_output("#{bin}/tui --version")
  end
end
