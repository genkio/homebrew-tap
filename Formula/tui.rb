class Tui < Formula
  desc "One launcher for cookie-stealth terminal readers: x, inoreader, slack, folo, reddit"
  homepage "https://github.com/genkio/tui"
  version "0.5.0"
  license "MIT"

  # `o` renders a story in carbonyl.
  depends_on "genkio/tap/carbonyl"

  on_macos do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.5.0/tui_0.5.0_darwin_arm64.tar.gz"
      sha256 "89b93f0cafbf17c6f06c26e64e7c9a63f50ea2c86f745293a7e07e6e0d6b1e80"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.5.0/tui_0.5.0_darwin_amd64.tar.gz"
      sha256 "d24eed1b1f6e3a706276af019b9752c23a60af6288db3045c47119afc873ab1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/genkio/tui/releases/download/v0.5.0/tui_0.5.0_linux_arm64.tar.gz"
      sha256 "5080ab301238063dd467904358ce914fab79117752701e95baff5178220d040f"
    end
    on_intel do
      url "https://github.com/genkio/tui/releases/download/v0.5.0/tui_0.5.0_linux_amd64.tar.gz"
      sha256 "eb7b058559bb6868aba3a18dcc4a17de24040e6788d9fac5fddf9517fa72f2ef"
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
