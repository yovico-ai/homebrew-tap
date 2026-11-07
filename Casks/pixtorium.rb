cask "pixtorium" do
  version "0.7.3"
  sha256 "6469af1ec9eb0e7479131bf485563364ff0e9a67f1e2135e97571c91f00de228"

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
