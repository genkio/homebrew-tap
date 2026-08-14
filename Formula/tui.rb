class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban, bilibili"
  homepage "https://github.com/genkio/tui"
  version "0.14.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.14.0/tui_0.14.0_darwin_arm64.tar.gz"
      sha256 "0ee91ab628416e49f613a23368dcd16fcbc08cb768fb01776d367934538596ae"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.14.0/tui_0.14.0_darwin_amd64.tar.gz"
      sha256 "60bc80abe24242f716d83302d3bccd4b041556bac11bce2689d4e08635fbc52c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.14.0/tui_0.14.0_linux_arm64.tar.gz"
      sha256 "ff5766920941a37d5b2747ff58db9c8c3f68548c9f334dba2c537d360ae7f08b"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.14.0/tui_0.14.0_linux_amd64.tar.gz"
      sha256 "f88172326e3850bda0bf945e45a206a7e210eff7631e8b2d52f27a6d16af72f2"
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
