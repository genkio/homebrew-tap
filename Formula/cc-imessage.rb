require "language/python"

class CcImessage < Formula
  desc "Two-way bridge between Claude Code tmux sessions and iMessage"
  homepage "https://github.com/genkio/cc-imessage"
  url "https://github.com/genkio/cc-imessage/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "2ae26fad6ec16a42fd3d455a745ab3304a104bd8aece6a6a92665e34f97f0f4c"

  depends_on "python@3.13"
  depends_on "tmux"

  def install
    bin.install "cc-imessage.py" => "cc-imessage"
    rewrite_shebang Language::Python::Shebang.detected_python_shebang(self), bin/"cc-imessage"
  end

  service do
    run [opt_bin/"cc-imessage", "run"]
    keep_alive true
    log_path var/"log/cc-imessage.log"
    error_log_path var/"log/cc-imessage.log"
  end

  def caveats
    <<~EOS
      cc-imessage has two sides:

        - Inbound daemon (phone replies -> tmux). Run in the background:
            brew services start genkio/tap/cc-imessage
          Logs go to #{var}/log/cc-imessage.log

        - Outbound. Add a Claude Code Stop hook so each session texts you:
            { "type": "command", "command": "cc-imessage notify" }

      Setup:
        1. Full Disk Access so the daemon can read chat.db. For brew services
           (launchd), grant it to the python that runs cc-imessage:
             head -1 "$(brew --prefix)/bin/cc-imessage"
           add that path (and its `readlink -f` target if the grant won't stick).
           For a foreground run, grant it to your terminal instead.
        2. Set PHONE in ~/.cc-imessage/config to your iMessage handle (E.164).

      Needs a running tmux server; sessions are discovered and driven through tmux.
    EOS
  end

  test do
    assert_match "cc-imessage", shell_output("#{bin}/cc-imessage --help")
  end
end
