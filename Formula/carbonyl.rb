class Carbonyl < Formula
  desc "Chromium-based browser that runs in the terminal (genkio fork)"
  homepage "https://github.com/genkio/carbonyl"
  version "0.2.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/genkio/carbonyl/releases/download/v0.2.0/carbonyl-macos-arm64"
      sha256 "c1be70fbb54ba0bb533f45dfcf66488a008489649da769e6bca9dca6ec936842"
    end
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.2.0/carbonyl-macos-x86_64"
      sha256 "54a8020f3d0df0fb1fdd4cabf4837901557551fa38cf2dba6c5378326ff7fbcc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.2.0/carbonyl-linux-x86_64"
      sha256 "a2b7d1e0d2fa33f025bc9d5207aebeadf807dfa60a7ad82662534699d2168ce5"
    end
  end

  def install
    bin.install Dir["carbonyl-*"].first => "carbonyl"
  end

  test do
    assert_predicate bin/"carbonyl", :executable?
  end
end
