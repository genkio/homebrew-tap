class Carbonyl < Formula
  desc "Chromium-based browser that runs in the terminal (genkio fork)"
  homepage "https://github.com/genkio/carbonyl"
  version "0.5.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/genkio/carbonyl/releases/download/v0.5.0/carbonyl-macos-arm64"
      sha256 "a4c13e400be53bc4077cc6e00a816efcdc62bee4ea3176070baf074ea4cb592f"
    end
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.5.0/carbonyl-macos-x86_64"
      sha256 "085add6efcb8cdc750319e6097486d57b098e41203c75c8f722463230d443c50"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.5.0/carbonyl-linux-x86_64"
      sha256 "4769bc662f43130c41dfacc68e5f4b4f460ae690f7d6aebb34a52f0c2cf16781"
    end
  end

  def install
    bin.install Dir["carbonyl-*"].first => "carbonyl"
  end

  test do
    assert_predicate bin/"carbonyl", :executable?
  end
end
