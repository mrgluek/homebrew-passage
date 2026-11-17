class PassageCli < Formula
  desc "Local SOCKS5 proxy for messaging apps (command-line)"
  homepage "https://passage.gluek.info"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.3/passage-cli-0.9.3-darwin-arm64.tar.gz"
      sha256 "2227daa850e558bc18c99f35fa1fb64dba7efe21d006be9766afe553dd8dcd3a"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.3/passage-cli-0.9.3-darwin-amd64.tar.gz"
      sha256 "ed23bae448ff68c2434a094395b934faab0d93fc66a8a52a89b64fb4bcc85c94"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.3/passage-cli-0.9.3-linux-arm64.tar.gz"
      sha256 "cea756d9400251725f06c9987584d1c30851772981aa60a678f1d58baeb7ae47"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.3/passage-cli-0.9.3-linux-amd64.tar.gz"
      sha256 "b24f38f3bf4031786a06820c4e620c28e27021fdd96904591c48ecbd24e28130"
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
