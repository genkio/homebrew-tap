class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban"
  homepage "https://github.com/genkio/tui"
  version "0.9.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.9.0/tui_0.9.0_darwin_arm64.tar.gz"
      sha256 "e3a4f668cfa59edbaa73d5f2c4b777834164e06934cf269b5ba590220939d642"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.9.0/tui_0.9.0_darwin_amd64.tar.gz"
      sha256 "a43c49c6aa4e035a4436e4e2ea77d2d951fa7a4e25f80a76fcb5776dd0df0774"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.9.0/tui_0.9.0_linux_arm64.tar.gz"
      sha256 "4e05753eae980036b23fdfc8448c73918309ae21cbd7277a0d241419d05349e5"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.9.0/tui_0.9.0_linux_amd64.tar.gz"
      sha256 "afbe253f5081549fb9853071157dfdec393c04f84866e0f02633bbbbbc5e6f93"
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
