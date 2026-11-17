cask "passage" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.3"
  sha256 arm:   "907dc402db4ef06c1c5f9d5a3bdb149f9abc868ae715dc88c65f7b19e93a580f",
         intel: "a9152b0ed9495a958370ab07400a2302c00cd8b8e7baa824f614749d0aaed343"

  url "https://github.com/mrgluek/passage/releases/download/v#{version}/passage-#{version}-darwin-#{arch}.zip"
  name "Passage"
  desc "Local SOCKS5 proxy for messaging apps"
  homepage "https://passage.gluek.info"

  auto_updates true
  depends_on macos: ">= :ventura"

  app "Passage.app"

  # The app is signed ad hoc, not notarized: remove the download quarantine.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Passage.app"],
                   must_succeed: false
  end

  zap trash: "~/Library/Application Support/Passage"
end
