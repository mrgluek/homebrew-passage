cask "passage" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.5"
  sha256 arm:   "690abcf5f9d4c259af179fbba0714c555d57be63be42acfee6666c6b6f51fe33",
         intel: "b6cdbb2f61af10ca8632cde29c8907aea69c0e8cd2af3d3a499e8210d1e960ac"

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
