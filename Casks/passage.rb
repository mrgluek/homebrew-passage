cask "passage" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.9"
  sha256 arm:   "91f21c1474b77a1235d4a19bb2962fc65b154f66308f21ad0508b0ee060dc8ea",
         intel: "a365aad7c714e80744f5af29798f0a0878ec7db7afc35f4a1a70c0b446262fe7"

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
