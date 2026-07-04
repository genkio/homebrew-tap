class Carbonyl < Formula
  desc "Chromium-based browser that runs in the terminal (genkio fork)"
  homepage "https://github.com/genkio/carbonyl"
  version "0.7.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/genkio/carbonyl/releases/download/v0.7.0/carbonyl-macos-arm64"
      sha256 "cf6549d05f901291a856d83c5af78af990bc869e8805e25695cbe943498078f4"
    end
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.7.0/carbonyl-macos-x86_64"
      sha256 "0eb825220a04edf37581267294e7e4bbfa60ef69f2d7dfb4d43c87d7d297d9df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.7.0/carbonyl-linux-x86_64"
      sha256 "64991289103110daf5a889f9ab2c1dfdb171b19ceb6110845139fde12986dca3"
    end
  end

  def install
    bin.install Dir["carbonyl-*"].first => "carbonyl"
  end

  test do
    assert_predicate bin/"carbonyl", :executable?
  end
end
