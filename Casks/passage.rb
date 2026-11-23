cask "passage" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.6"
  sha256 arm:   "c6b7d64348c15de23198a92639233dd0636227a912e08832207e043db6689ced",
         intel: "6dbbdb27c32c3afc8e2abba96adbde5f58579ec472049a7ab147be06d860629d"

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
