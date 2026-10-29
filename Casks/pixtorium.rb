cask "pixtorium" do
  version "0.5.5"
  sha256 "c988e69f2656e91198e193ee14c16d9ef747c6ab25ad0fc222d10296a8f35a2a"

  url "https://pixtorium.com/downloads/pixtorium-#{version}-macos-arm64.dmg"
  name "Pixtorium"
  desc "Approachable, AI-native image editor (open beta)"
  homepage "https://pixtorium.com/"

  livecheck do
    url "https://pixtorium.com/download/"
    regex(/pixtorium-(\d+(?:\.\d+)+)-macos-arm64\.dmg/i)
  end

  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Pixtorium.app"
  binary "#{appdir}/Pixtorium.app/Contents/MacOS/pixtorium-mcp"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pixtorium.app"]
  end

  zap trash: [
    "~/Library/Application Support/Pixtorium",
    "~/Library/Preferences/ai.yovico.pixtorium.plist",
  ]
end
