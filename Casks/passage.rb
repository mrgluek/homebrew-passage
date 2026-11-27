cask "passage" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.8"
  sha256 arm:   "e800380372927ef62539f19d9f9648deee8b9e7b0ebc072d498297f156208225",
         intel: "f2ae121778b869c8deb1e5c94796489e943833a3d97584769db9a3a16039569c"

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
