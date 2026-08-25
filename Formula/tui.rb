class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban, bilibili"
  homepage "https://github.com/genkio/tui"
  version "0.17.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.17.0/tui_0.17.0_darwin_arm64.tar.gz"
      sha256 "c8b1f70e5d65f62abe9cb933868f234dfbe1f0f605180d43c4772b15e48b4045"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.17.0/tui_0.17.0_darwin_amd64.tar.gz"
      sha256 "81883c89bae2a1050613a1ca4f4536047bcc248eae7b8b6ea84b89293e48ab44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.17.0/tui_0.17.0_linux_arm64.tar.gz"
      sha256 "609d25049cd89087ca6be5e8aa5ed1cc7783e4c5c2ece0ed55969c96e589e115"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.17.0/tui_0.17.0_linux_amd64.tar.gz"
      sha256 "b37a7e1959a9220449c82c392787a71d103172148598fa5aa6a19fcf1f98b5b1"
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
