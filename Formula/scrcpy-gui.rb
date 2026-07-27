class ScrcpyGui < Formula
  desc "Mirror and control Android devices from a GUI on top of scrcpy (genkio fork)"
  homepage "https://github.com/genkio/scrcpy-gui"
  version "2.2.2"
  license "Apache-2.0"

  depends_on :macos
  depends_on "scrcpy"

  on_macos do
    on_arm do
      url "https://github.com/genkio/scrcpy-gui/releases/download/v2.2.2/ScrcpyGui-2.2.2-arm64.zip"
      sha256 "5701c0501f9831559784a1e0378638f4aa0806a52005f8bf5c0f73c38dc5e606"
    end
    on_intel do
      url "https://github.com/genkio/scrcpy-gui/releases/download/v2.2.2/ScrcpyGui-2.2.2-x64.zip"
      sha256 "41d8c54893fa1f553de0dec8208709abb8cbfc4961b09c5c316106df75062d28"
    end
  end

  preserve_rpath

  def install
    # a zip holding nothing but a directory is staged from inside it, so the bundle
    # contents can arrive in the cwd instead of as ScrcpyGui.app/
    if File.directory?("ScrcpyGui.app")
      prefix.install "ScrcpyGui.app"
    else
      (prefix/"ScrcpyGui.app").install Dir["*"]
    end

    libraries = prefix/"ScrcpyGui.app/Contents/Frameworks/Electron Framework.framework/Versions/A/Libraries"
    {
      "libEGL.dylib"    => "@rpath/E",
      "libGLESv2.dylib" => "@rpath/G",
      "libffmpeg.dylib" => "@rpath/F",
    }.each do |library, id|
      MachO::Tools.change_dylib_id libraries/library, id
    end

    # launched by path rather than copied into /Applications, so it stays a terminal command
    (bin/"scrcpy-gui").write <<~SH
      #!/bin/bash
      exec "#{opt_prefix}/ScrcpyGui.app/Contents/MacOS/ScrcpyGui" "$@"
    SH
    (bin/"scrcpy-gui").chmod 0755
  end

  def post_install
    system "codesign", "--force", "--deep", "--sign", "-", prefix/"ScrcpyGui.app"
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
    assert_match version.to_s, (prefix/"ScrcpyGui.app/Contents/Info.plist").read
  end
end
