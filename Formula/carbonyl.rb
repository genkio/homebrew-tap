class Carbonyl < Formula
  desc "Chromium-based browser that runs in the terminal (genkio fork)"
  homepage "https://github.com/genkio/carbonyl"
  version "0.1.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/genkio/carbonyl/releases/download/v0.1.0/carbonyl-macos-arm64"
      sha256 "3bda8ecc2a143e669e24beafffd06b5652947b7bca047260a9478384a7582004"
    end
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.1.0/carbonyl-macos-x86_64"
      sha256 "4128662758817eb7a1b63895a3072900ae202b0b659bc8fc076db60492718c1b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.1.0/carbonyl-linux-x86_64"
      sha256 "01780faa193fe6763c8da0fb06fe7c5969fac22ca094418216821e98b23cb86d"
    end
  end

  def install
    bin.install Dir["carbonyl-*"].first => "carbonyl"
  end

  test do
    assert_predicate bin/"carbonyl", :executable?
  end
end
