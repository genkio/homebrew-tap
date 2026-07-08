class CcImessage < Formula
  desc "Two-way bridge between Claude Code tmux sessions and iMessage"
  homepage "https://github.com/genkio/cc-imessage"
  version "0.2.0"

  # Prebuilt standalone binary so it has its own code identity: Full Disk Access
  # scopes to just cc-imessage, not the shared Python interpreter.
  on_arm do
    url "https://github.com/genkio/cc-imessage/releases/download/v0.2.0/cc-imessage-0.2.0-arm64.tar.gz"
    sha256 "2a232ff6a8670634b4b02992a29d135bf306b9f270bade6ebd72884009050707"
  end

  depends_on "tmux"
  depends_on :macos

  def install
    bin.install "cc-imessage"
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
        1. Full Disk Access so it can read chat.db. Grant it to the binary itself
           (its own code identity, nothing else inherits it):
             #{opt_bin}/cc-imessage
        2. Set PHONE in ~/.cc-imessage/config to your iMessage handle (E.164).

      Needs a running tmux server; sessions are discovered and driven through tmux.

      arm64 only for now. On Intel, build from source: `make build` in the repo.
    EOS
  end

  test do
    assert_match "cc-imessage", shell_output("#{bin}/cc-imessage --help")
  end
end
