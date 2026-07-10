class CcImessage < Formula
  desc "Two-way bridge between Claude Code tmux sessions and iMessage"
  homepage "https://github.com/genkio/cc-imessage"
  # Prebuilt standalone binary so it has its own code identity. arm64 only.
  url "https://github.com/genkio/cc-imessage/releases/download/v0.4.0/cc-imessage-0.4.0-arm64.tar.gz"
  # explicit: brew otherwise parses "64" out of "arm64" in the filename
  version "0.4.0"
  sha256 "98e03016b9915c0c67c5ce3c48ef0b829235355ff0f2f9b60919cf394c09bc50"

  depends_on arch: :arm64
  depends_on :macos
  depends_on "tmux"

  # Frozen TCC anchor. launchd runs this, not cc-imessage directly, so FDA +
  # Automation grants attach to bytes that never change across tool upgrades.
  # Pinned independently of the tool version; rebuilt ~never.
  resource "launcher" do
    url "https://github.com/genkio/cc-imessage/releases/download/launcher-v1.0.0/ccim-launcher-1.0.0-arm64.tar.gz"
    sha256 "a970d3bbb9eb71c6b588e3c1805bd18e46d376d69fa2e529850e9c998c2d5451"
  end

  def install
    bin.install "cc-imessage"
    resource("launcher").stage { libexec.install "ccim-launcher" }
  end

  # Copy the launcher to a var/ path brew upgrades never touch, so the grants
  # made there persist. Only replace it when the bundled bytes actually differ
  # (a launcher version bump): byte-stability at this path is the TCC mechanism.
  def post_install
    bundled = libexec/"ccim-launcher"
    target = var/"cc-imessage/ccim-launcher"
    return if target.exist? && compare_file(bundled, target)

    target.dirname.mkpath
    cp bundled, target
    target.chmod 0755
  end

  service do
    run [var/"cc-imessage/ccim-launcher"]
    keep_alive true
    # launchd's minimal PATH lacks Homebrew's bin, where tmux lives
    environment_variables PATH:        "#{HOMEBREW_PREFIX}/bin:/usr/bin:/bin:/usr/sbin:/sbin",
                          CCIM_DAEMON: opt_bin/"cc-imessage"
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

      One-time setup (grants attach to the frozen launcher, not the tool, so
      they survive every future upgrade):
        1. Grant Full Disk Access to the launcher so it can read chat.db:
             #{var}/cc-imessage/ccim-launcher
           then restart the service:
             brew services restart genkio/tap/cc-imessage
        2. On the first outbound send, macOS pops an Automation popover asking
           to let ccim-launcher control Messages - click Allow.
        3. Set PHONE in ~/.cc-imessage/config to your iMessage handle (E.164).

      Future upgrades need no re-grants - just restart the service:
        brew services restart genkio/tap/cc-imessage

      Needs a running tmux server; sessions are discovered and driven through tmux.

      arm64 only for now. On Intel, build from source: `make build` in the repo.
    EOS
  end

  test do
    assert_match "cc-imessage", shell_output("#{bin}/cc-imessage --help")
  end
end
