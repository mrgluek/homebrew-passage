cask "passage" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.4"
  sha256 arm:   "c332c1d332e02030280e39538be97e0423c903c97d5e612c936847d1e24f4702",
         intel: "a0eb7b6d780dde5fd3193d4fc4177bd85499be4c11c93592d96e988d0900e3e8"

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
