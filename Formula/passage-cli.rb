class PassageCli < Formula
  desc "Local SOCKS5 proxy for messaging apps (command-line)"
  homepage "https://passage.gluek.info"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.5/passage-cli-0.9.5-darwin-arm64.tar.gz"
      sha256 "c769f65222bdeb6f8f54e36a5b5c42c36aa4026a7e93fea593398c93be0ef211"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.5/passage-cli-0.9.5-darwin-amd64.tar.gz"
      sha256 "62296742bf7422f0da676ce3c4431e2883f24749886f422956508ab649ae7b50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.5/passage-cli-0.9.5-linux-arm64.tar.gz"
      sha256 "9ef6e028a9ef061e1881deda229b184f05d68d5e67bdb81cf28361566372dfd9"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.5/passage-cli-0.9.5-linux-amd64.tar.gz"
      sha256 "807d3b8e5dad154592b7479fd33ab6884d6b30a9f3043b00f014e202f4c8b049"
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
