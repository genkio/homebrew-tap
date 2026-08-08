class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit, douban"
  homepage "https://github.com/genkio/tui"
  version "0.8.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.8.0/tui_0.8.0_darwin_arm64.tar.gz"
      sha256 "17d81729c2b2c0d7415b02296f33caabf52d0388596a344505f4401a7ef3848b"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.8.0/tui_0.8.0_darwin_amd64.tar.gz"
      sha256 "d83e3ae5596f539a2611dd63034f1fa745a505f226b1144dc0dead2b42304a47"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.8.0/tui_0.8.0_linux_arm64.tar.gz"
      sha256 "7a4024c5b12968c544dfea04befae4e5245c2c94904f7cfa6e1d437fc972060a"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.8.0/tui_0.8.0_linux_amd64.tar.gz"
      sha256 "c80fb47ae7cb65052b5cd8df021c0d4bfa9dff95ffe16609c6b93e38ddbc0c24"
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
