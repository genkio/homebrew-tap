class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban, bilibili"
  homepage "https://github.com/genkio/tui"
  version "0.19.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.19.0/tui_0.19.0_darwin_arm64.tar.gz"
      sha256 "a7d5e89622ddb25e261411d9e74d721f5ce526a78f643d69fb62bda6a69a01a7"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.19.0/tui_0.19.0_darwin_amd64.tar.gz"
      sha256 "4fd0190cf901c415e317be89f50fe041b069062bbc312c5baa730c0c36433220"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.19.0/tui_0.19.0_linux_arm64.tar.gz"
      sha256 "ad46656afa8f444eb30869f66066e40a3adb4b40e54b04bf0a1ce1239e968f7a"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.19.0/tui_0.19.0_linux_amd64.tar.gz"
      sha256 "47c08490d287901d9001e05aa6d0442a0e80fc10da8b443b70b8562e8775470b"
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
