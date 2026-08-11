class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban"
  homepage "https://github.com/genkio/tui"
  version "0.12.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.12.0/tui_0.12.0_darwin_arm64.tar.gz"
      sha256 "1f66d5b9614adb6fcb8937b875f5a0f90b6b75356d6bdf20e2cc330fac91cc37"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.12.0/tui_0.12.0_darwin_amd64.tar.gz"
      sha256 "bd8386dc00158e9b236fd966de3741eb223f60adc7eccde8b68b664d83ed0ded"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.12.0/tui_0.12.0_linux_arm64.tar.gz"
      sha256 "84c1efd039647147bb9af50554df71f2a1dd9556c531cbb5c4ab8e5ab5c60bcb"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.12.0/tui_0.12.0_linux_amd64.tar.gz"
      sha256 "86bef4d0f5df4e60c35cca0a46f0827220e9cc4ff49c8dfc34467744f277091c"
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
