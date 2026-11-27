class PassageCli < Formula
  desc "Local SOCKS5 proxy for messaging apps (command-line)"
  homepage "https://passage.gluek.info"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.8/passage-cli-0.9.8-darwin-arm64.tar.gz"
      sha256 "3bc02f10f69a8254f4ff4398898265504dedb1383f0dae509bc43e22fbaaf91a"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.8/passage-cli-0.9.8-darwin-amd64.tar.gz"
      sha256 "932cbb87e86b061de7ee53f39e689f56376f57466163a7099371b1ebeb45e533"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.8/passage-cli-0.9.8-linux-arm64.tar.gz"
      sha256 "97b4c73cf48871f31412787386c3d58d60e01bfeec2186a2c5331ec117679a41"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.8/passage-cli-0.9.8-linux-amd64.tar.gz"
      sha256 "5e7781ce5e36d159bf75e216efdd28d421d0902b95bb48aa7d2bc0a1aa515555"
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
