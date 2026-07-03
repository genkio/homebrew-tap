class Carbonyl < Formula
  desc "Chromium-based browser that runs in the terminal (genkio fork)"
  homepage "https://github.com/genkio/carbonyl"
  version "0.6.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/genkio/carbonyl/releases/download/v0.6.0/carbonyl-macos-arm64"
      sha256 "1ff977fddd60b13c059c238ac554f11f128c83e6fe6325ddc9ab6be78717631d"
    end
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.6.0/carbonyl-macos-x86_64"
      sha256 "244727b2f51aaaba0e2c28a875d7acc89f1b3e3eff29dc7a0a9314a9bf148876"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.6.0/carbonyl-linux-x86_64"
      sha256 "23391210b35337dbaa3ee1312ba6282131f64645216858312d64d55e698bac7f"
    end
  end

  def install
    bin.install Dir["carbonyl-*"].first => "carbonyl"
  end

  test do
    assert_predicate bin/"carbonyl", :executable?
  end
end
