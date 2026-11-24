class PassageCli < Formula
  desc "Local SOCKS5 proxy for messaging apps (command-line)"
  homepage "https://passage.gluek.info"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.7/passage-cli-0.9.7-darwin-arm64.tar.gz"
      sha256 "5e13d8be23f43681a1b657115b737ccdfe8fee72e16af19276f3008a92754f97"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.7/passage-cli-0.9.7-darwin-amd64.tar.gz"
      sha256 "752848218bc23be557013fa09d73f622754db8680f26696c3741f9a4594b3cb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.7/passage-cli-0.9.7-linux-arm64.tar.gz"
      sha256 "6c868a858fae8f8bf7e933044717c2542c804bec00a6e6cf506c2321803ec841"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.7/passage-cli-0.9.7-linux-amd64.tar.gz"
      sha256 "effcfb32fa40026e3107ef3c76c40b2a62bf636225bb555c0de4ca84fcca0a1e"
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
