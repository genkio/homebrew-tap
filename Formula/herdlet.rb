class Herdlet < Formula
  include Language::Python::Shebang

  desc "Tiny coordination bus for coding agents in tmux panes"
  homepage "https://github.com/genkio/herdlet"
  url "https://github.com/genkio/herdlet/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "7bb3ed9a0fa9cfbea0ba2524850ca954b22ef634a617fd203cd7feee3b286e66"
  license "MIT"

  depends_on "python@3.13"
  depends_on "tmux"

  def install
    rewrite_shebang detected_python_shebang, "herdlet.py"
    bin.install "herdlet.py" => "herdlet"
    doc.install "skills/herdlet/SKILL.md", "README.md"
  end

  def caveats
    <<~EOS
      One-time wiring (hooks, agent skill, permissions; idempotent):
        herdlet setup

      No daemon to manage: herdlet auto-starts it on first use
      (socket at ~/.herdlet.sock).

      Live status popup for your tmux.conf:
        bind m display-popup -E -w 80% -h 60% -T " agents " "herdlet monitor"

      Docs: #{doc}/README.md
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
