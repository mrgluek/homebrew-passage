class PassageCli < Formula
  desc "Local SOCKS5 proxy for messaging apps (command-line)"
  homepage "https://passage.gluek.info"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.2/passage-cli-0.9.2-darwin-arm64.tar.gz"
      sha256 "c7e61fc67ac1a8075f769c066c1f77c1a79915c3625391f40b72f405590a5ea0"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.2/passage-cli-0.9.2-darwin-amd64.tar.gz"
      sha256 "3f7e0bf6c68095270f2dce521b2645d01b009356deb303d1dd904bb9019bfb72"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.2/passage-cli-0.9.2-linux-arm64.tar.gz"
      sha256 "d0c667c435abffdea381881ede8ad71365a4331a189cede79f57a1040ec79e25"
    end
    on_intel do
      url "https://github.com/mrgluek/passage/releases/download/v0.9.2/passage-cli-0.9.2-linux-amd64.tar.gz"
      sha256 "d24bf6bb6a93ad7119e15302c2675953663d6d6d8d58dfbf83793e4726167b4c"
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
