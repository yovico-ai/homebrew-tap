cask "pixtorium" do
  version "0.6.1"
  sha256 "56feb475a41c6f91ee82b5bb9941d6432708fdf05069ba54f2d374c03ed8b2fd"

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
