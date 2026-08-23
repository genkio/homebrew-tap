class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban, bilibili"
  homepage "https://github.com/genkio/tui"
  version "0.15.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.15.0/tui_0.15.0_darwin_arm64.tar.gz"
      sha256 "cbe09f0b2b83d674cce08892b390ee407ae8d74cb1b8ae64d9c9feb99436eac5"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.15.0/tui_0.15.0_darwin_amd64.tar.gz"
      sha256 "605cebd05f9b492acc8c5d3e676bb3c45fba78c2c381f8a683dd9897edac7091"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.15.0/tui_0.15.0_linux_arm64.tar.gz"
      sha256 "7462bde7d3548abcf3fe710477b69e35ac023892cce8886c3f455f80df48522b"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.15.0/tui_0.15.0_linux_amd64.tar.gz"
      sha256 "e8a53824eed7b77ea2ac21129e90f208abeda8dad6590e10431bfa462e66c425"
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
