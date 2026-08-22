# Homebrew cask for Leash.
#
# Release automation fills in `version` + `sha256` for the notarized Developer-ID
# archive and publishes this file to `adrianmcgee/homebrew-leash`, after which:
#
#   brew install --cask adrianmcgee/leash/leash
cask "leash" do
  version "2.21"
  sha256 "ff0c7fb5d2ce1b5a62dad0c412f50be11db9338bc545f21f079a1591fd5e4c9d"

  url "https://github.com/adrianmcgee/leash/releases/download/v#{version}/Leash-#{version}.zip",
      verified: "github.com/adrianmcgee/leash/"
  name "Leash"
  desc "Remote approvals and notifications for your AI coding agent"
  homepage "https://adrianmcgee.github.io/leash/"

  # Sparkle delivers in-app updates; don't let Homebrew fight it.
  auto_updates true
  depends_on macos: :sonoma

  app "Leash.app"

  zap trash: [
    "~/.claude-notify",
    "~/Library/Preferences/com.adrianmcgee.claudenotify.mac.plist",
    "~/Library/Caches/com.adrianmcgee.claudenotify.mac",
  ]
end
