class Carbonyl < Formula
  desc "Chromium-based browser that runs in the terminal (genkio fork)"
  homepage "https://github.com/genkio/carbonyl"
  version "0.3.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/genkio/carbonyl/releases/download/v0.3.0/carbonyl-macos-arm64"
      sha256 "5de142cc83ee0246f8174bbb41fd4bde9505b368b3341ce28187111509339ffa"
    end
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.3.0/carbonyl-macos-x86_64"
      sha256 "e1c8afaee629d1bc6502f45570d55ba67b045fbe88d447b8ad792c0438d8bf54"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.3.0/carbonyl-linux-x86_64"
      sha256 "ed38427e964682c2bf8ed552520a724196da34de7b3c0d5604ca142d115adcf2"
    end
  end

  def install
    bin.install Dir["carbonyl-*"].first => "carbonyl"
  end

  test do
    assert_predicate bin/"carbonyl", :executable?
  end
end
