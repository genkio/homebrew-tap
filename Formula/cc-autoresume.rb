require "language/python"

class CcAutoresume < Formula
  desc "Auto-resume Claude Code tmux sessions after a usage-limit reset"
  homepage "https://github.com/genkio/cc-autoresume"
  url "https://github.com/genkio/cc-autoresume/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "29da5fe97cf35d2b1635fcde9ff669520c74fe52cb82a18faf8e08a7a18f62f5"

  depends_on "python@3.13"
  depends_on "tmux"

  def install
    bin.install "cc-autoresume.py" => "cc-autoresume"
    rewrite_shebang Language::Python::Shebang.detected_python_shebang(self), bin/"cc-autoresume"
  end

  service do
    run [opt_bin/"cc-autoresume"]
    keep_alive true
    log_path var/"log/cc-autoresume.log"
    error_log_path var/"log/cc-autoresume.log"
  end

  def caveats
    <<~EOS
      cc-autoresume is a foreground daemon. Run it directly:
        cc-autoresume            # live
        cc-autoresume --dry-run -v
        cc-autoresume --list

      Or run it in the background via brew services:
        brew services start genkio/tap/cc-autoresume
      Logs then go to #{var}/log/cc-autoresume.log

      It discovers Claude sessions through tmux, so a tmux server must be
      running for panes to be found.
    EOS
  end

  test do
    assert_match "cc-autoresume", shell_output("#{bin}/cc-autoresume --help")
  end
end
