cask "passage" do
  arch arm: "arm64", intel: "amd64"

  version "0.9.2"
  sha256 arm:   "9b2a934635b8bcc91c48eecd44fc48ba9cb4f0f3be4d5b659a724e3e5c9febe8",
         intel: "cc273569164d40c1374ab15f24e61c087338af1d70f8ff255d4670fac3ace0ba"

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
