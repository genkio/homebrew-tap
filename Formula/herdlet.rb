class Herdlet < Formula
  include Language::Python::Shebang

  desc "Tiny coordination bus for coding agents in tmux panes"
  homepage "https://github.com/genkio/herdlet"
  url "https://github.com/genkio/herdlet/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "7413b156891ea8b2518246193bbaa56e7b31e3c5c3c63c3062e07247bbc14af0"
  license "MIT"

  depends_on "python@3.13"
  depends_on "tmux"

  def install
    rewrite_shebang detected_python_shebang, "herdlet.py"
    bin.install "herdlet.py" => "herdlet"
    doc.install "SKILL.md", "README.md"
  end

  def caveats
    <<~EOS
      No daemon to manage: herdlet auto-starts it on first use
      (socket at ~/.herdlet.sock).

      Agent state updates automatically once you add `herdlet hook` to your
      Claude Code / Codex hooks; see:
        #{doc}/README.md

      To let agents coordinate with each other, install the skill:
        mkdir -p ~/.claude/skills/herdlet
        cp #{doc}/SKILL.md ~/.claude/skills/herdlet/

      Live status popup for your tmux.conf:
        bind m display-popup -E -w 80% -h 60% -T " agents " "herdlet monitor"
    EOS
  end

  test do
    assert_match "herdlet", shell_output("#{bin}/herdlet --version")
    sock = testpath/"h.sock"
    pid = spawn bin/"herdlet", "--socket", sock, "serve"
    sleep 1
    begin
      out = shell_output("#{bin}/herdlet --socket #{sock} report --id t --state done")
      assert_match "reported", out
      out = shell_output("#{bin}/herdlet --socket #{sock} wait --id t --state done --timeout 2")
      assert_match "\"already\": true", out
    ensure
      Process.kill "TERM", pid
    end
  end
end
