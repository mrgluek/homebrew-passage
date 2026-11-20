class PassageCli < Formula
  desc "Local SOCKS5 proxy for messaging apps (command-line)"
  homepage "https://passage.gluek.info"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.4/passage-cli-0.9.4-darwin-arm64.tar.gz"
      sha256 "99d4925d586570674280efd958580db42646ae3dcde5c7299fe65b0920075803"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.4/passage-cli-0.9.4-darwin-amd64.tar.gz"
      sha256 "134038dd311e00cca7869ebe8f89f6c3cd641f4070bf0b4e35e913a7fbd58202"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.4/passage-cli-0.9.4-linux-arm64.tar.gz"
      sha256 "7659f41c1a6ea0142314e8bc508a677348dc5fd019cdea36603ff73c774d355c"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.4/passage-cli-0.9.4-linux-amd64.tar.gz"
      sha256 "7d6b948a5b3a75e4ad2ef420d3ed5ea4c619c391f04bb0b22dfa2675c63bb62d"
    end
  end

  def install
    # passage-iroh must stay next to passage-cli, which finds it by its real path.
    libexec.install "passage-cli", "passage-iroh"
    bin.install_symlink libexec/"passage-cli"
  end

  test do
    assert_predicate libexec/"passage-iroh", :executable?
    assert_match "-link-file", shell_output("#{bin}/passage-cli -h 2>&1")
  end
end
