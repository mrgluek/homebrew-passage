class PassageCli < Formula
  desc "Local SOCKS5 proxy for messaging apps (command-line)"
  homepage "https://passage.gluek.info"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.9/passage-cli-0.9.9-darwin-arm64.tar.gz"
      sha256 "5c9747bd1a62ffe40b4c40ff7f572d682990209bc2f4d18f5a27b11268c78bf7"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.9/passage-cli-0.9.9-darwin-amd64.tar.gz"
      sha256 "848856608ebb5ba00ab840e0e0a55dd1911eea564ec0d02074bda58d828ab2b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.9/passage-cli-0.9.9-linux-arm64.tar.gz"
      sha256 "97a9fc98aa7d4e0229ec3c99f2f63dc6ad31b5f37ef71f0bbf05e487007e1b6c"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.9/passage-cli-0.9.9-linux-amd64.tar.gz"
      sha256 "126dd4278d3f48acb0b4d5d93735e5bd24b108390f69b061ed665ba62317d684"
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
