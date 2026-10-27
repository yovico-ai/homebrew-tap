cask "pixtorium" do
  version "0.5.2"
  sha256 "9d037b1a7d5d6b344d4588e7d0f4e81b985cc6b6ddb8e6acfd29f50b827cc965"

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
