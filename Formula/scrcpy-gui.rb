class ScrcpyGui < Formula
  desc "Mirror and control Android devices from a GUI on top of scrcpy (genkio fork)"
  homepage "https://github.com/genkio/scrcpy-gui"
  version "2.0.0"
  license "Apache-2.0"

  depends_on :macos
  depends_on "scrcpy"

  on_macos do
    on_arm do
      url "https://github.com/genkio/scrcpy-gui/releases/download/v2.0.0/ScrcpyGui-2.0.0-arm64.zip"
      sha256 "5c68ae1063110f736f20524ba143b1c41a3dfee1655f48900295e3a705e9103b"
    end
    on_intel do
      url "https://github.com/genkio/scrcpy-gui/releases/download/v2.0.0/ScrcpyGui-2.0.0-x64.zip"
      sha256 "014a1af43e8a0f35d99db7ef597303d82fa8a9d01c30920c9d874ac007e83d12"
    end
  end

  def install
    # a zip holding nothing but a directory is staged from inside it, so the bundle
    # contents can arrive in the cwd instead of as ScrcpyGui.app/
    if File.directory?("ScrcpyGui.app")
      prefix.install "ScrcpyGui.app"
    else
      (prefix/"ScrcpyGui.app").install Dir["*"]
    end

    # launched by path rather than copied into /Applications, so it stays a terminal command
    (bin/"scrcpy-gui").write <<~SH
      #!/bin/bash
      exec "#{opt_prefix}/ScrcpyGui.app/Contents/MacOS/ScrcpyGui" "$@"
    SH
    (bin/"scrcpy-gui").chmod 0755
  end

  def caveats
    <<~EOS
      scrcpy-gui drives adb, which ships in the android-platform-tools cask:
        brew install --cask android-platform-tools

      The app is ad-hoc signed, not notarized. Homebrew downloads it with curl so it
      carries no quarantine flag and launches as-is; a browser download would not.
    EOS
  end

  test do
    assert_predicate prefix/"ScrcpyGui.app/Contents/MacOS/ScrcpyGui", :executable?
    assert_match "2.0.0", (prefix/"ScrcpyGui.app/Contents/Info.plist").read
  end
end
