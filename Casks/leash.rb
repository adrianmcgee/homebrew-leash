# Homebrew cask for Leash — STAGED, not yet live.
#
# This goes live the first time `scripts/release.sh --mac` produces a notarized
# Developer-ID DMG (gated on the signing certificate). On each release, release.sh
# fills in `version` + `sha256` and publishes this file to the tap repo
# `adrianmcgee/homebrew-leash`, after which:
#
#   brew install --cask adrianmcgee/leash/leash
#
# The placeholder sha256 below is intentional — `brew` will refuse to install
# until release.sh stamps the real checksum, so a half-staged cask can't mislead.
cask "leash" do
  version "2.17"
  sha256 "b1ed521a938ad84946b486081ce05e5b9cab21e20b2001878864be21d5a71f01"

  url "https://github.com/adrianmcgee/leash/releases/download/v#{version}/Leash.dmg",
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
