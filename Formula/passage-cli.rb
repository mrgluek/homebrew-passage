class PassageCli < Formula
  desc "Local SOCKS5 proxy for messaging apps (command-line)"
  homepage "https://passage.gluek.info"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.6/passage-cli-0.9.6-darwin-arm64.tar.gz"
      sha256 "fcf6a99f0236833b1e3bf549152e202e2ccb467c302bd0973bdd4a3e55e5a5aa"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.6/passage-cli-0.9.6-darwin-amd64.tar.gz"
      sha256 "4dd27b65f769ace9d3d006a27cda80bfd934af89bd1d0bdb8bfc608e2863fd29"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.6/passage-cli-0.9.6-linux-arm64.tar.gz"
      sha256 "9a09e00d0358f56109d3913713b37ef01b4fb0c695ebeba3929e29909eea7783"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.6/passage-cli-0.9.6-linux-amd64.tar.gz"
      sha256 "dcf19761b89533e8e233c4a3b31ff9382cde706913690e7c5ef1500687516978"
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
