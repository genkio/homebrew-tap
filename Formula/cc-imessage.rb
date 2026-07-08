class CcImessage < Formula
  desc "Two-way bridge between Claude Code tmux sessions and iMessage"
  homepage "https://github.com/genkio/cc-imessage"
  # Prebuilt standalone binary so it has its own code identity: Full Disk Access
  # scopes to just cc-imessage, not the shared Python interpreter. arm64 only.
  url "https://github.com/genkio/cc-imessage/releases/download/v0.3.1/cc-imessage-0.3.1-arm64.tar.gz"
  # explicit: brew otherwise parses "64" out of "arm64" in the filename
  version "0.3.1"
  sha256 "e6ff03330b624ef883aaa224e6d81b1e193ab17f769ebed6648c04fe6ee398a1"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "tmux"

  def install
    bin.install "cc-imessage"
  end

  service do
    run [opt_bin/"cc-imessage", "run"]
    keep_alive true
    # launchd's minimal PATH lacks Homebrew's bin, where tmux lives
    environment_variables PATH: "#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin"
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
