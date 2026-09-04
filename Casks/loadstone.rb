cask "loadstone" do
  version "0.2.0"
  sha256 "5261bb868424247bfffb862c2d9fb2177d8f1f86aaa4294627bd89852f213bad"

  url "https://github.com/mortenbrudvik/loadstone/releases/download/v#{version}/Loadstone-#{version}.zip"
  name "Loadstone"
  desc "Menu-bar window manager for halves, corners, and thirds"
  homepage "https://github.com/mortenbrudvik/loadstone"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Loadstone.app"

  # Loadstone turns macOS's own edge tiling off while it runs and back on when it quits
  # normally, so ask it to quit rather than kill it before replacing or removing the bundle.
  uninstall quit: "com.brudvik.loadstone"

  zap trash: "~/Library/Preferences/com.brudvik.loadstone.plist"
end
