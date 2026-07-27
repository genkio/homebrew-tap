class ScrcpyGui < Formula
  desc "Mirror and control Android devices from a GUI on top of scrcpy (genkio fork)"
  homepage "https://github.com/genkio/scrcpy-gui"
  version "2.2.3"
  license "Apache-2.0"

  depends_on :macos
  depends_on "scrcpy"

  on_macos do
    on_arm do
      url "https://github.com/genkio/scrcpy-gui/releases/download/v2.2.3/ScrcpyGui-2.2.3-arm64.zip"
      sha256 "40a6d90d774731897b4050523bb2377cd53bf7e43008204d80c5f682cdd7456d"
    end
    on_intel do
      url "https://github.com/genkio/scrcpy-gui/releases/download/v2.2.3/ScrcpyGui-2.2.3-x64.zip"
      sha256 "4fe579d2fb2ff4d29ac6309395ab4060b54d596e021c2763a61a88beca338f2e"
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
