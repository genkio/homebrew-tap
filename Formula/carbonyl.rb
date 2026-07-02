class Carbonyl < Formula
  desc "Chromium-based browser that runs in the terminal (genkio fork)"
  homepage "https://github.com/genkio/carbonyl"
  version "0.4.0"
  license "BSD-3-Clause"

  on_macos do
    on_arm do
      url "https://github.com/genkio/carbonyl/releases/download/v0.4.0/carbonyl-macos-arm64"
      sha256 "decf76bbf163a46076a7c27aeadb1f1d27528cb4fafffc3bc95097e1b396e145"
    end
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.4.0/carbonyl-macos-x86_64"
      sha256 "39f52240697d318be8cc61b6f170501e6fdef281320ffddf8a68d87a93bac94a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/genkio/carbonyl/releases/download/v0.4.0/carbonyl-linux-x86_64"
      sha256 "a6eacaa67c64080c822f0be21ac28956b9a0398e9bd102cbb4fa9c9f1e7f36eb"
    end
  end

  def install
    bin.install Dir["carbonyl-*"].first => "carbonyl"
  end

  test do
    assert_predicate bin/"carbonyl", :executable?
  end
end
