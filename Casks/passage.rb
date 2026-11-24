cask "passage" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.7"
  sha256 arm:   "fb260286f71878b762c09f91743759185f120c036fad1992d801f0a8cc78fd0d",
         intel: "4d7c0d2c7ef22dacd28ed7e57c55d37580652cb45511454c1e5b3a2ceaa4897b"

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
