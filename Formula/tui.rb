class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit"
  homepage "https://github.com/genkio/tui"
  version "0.6.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.6.0/tui_0.6.0_darwin_arm64.tar.gz"
      sha256 "d49693dd72eeee2862d35f62ef3e82b238818db2c1ff1e194afab9d5ac109b7d"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.6.0/tui_0.6.0_darwin_amd64.tar.gz"
      sha256 "a434048de4e82b50524888e9e833cc6432cd50edafbdb044539b5c290cefe1a8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.6.0/tui_0.6.0_linux_arm64.tar.gz"
      sha256 "29fa895c64641c5315714c5ec46f5b580aa04b8a100a98031006c00f40dd3f19"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.6.0/tui_0.6.0_linux_amd64.tar.gz"
      sha256 "87fef341f75d9bd341b1d2ba1959aac3f78547af69c7e1d99c53bbbfff9ed414"
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
