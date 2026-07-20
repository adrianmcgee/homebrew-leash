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
  version "2.8"
  sha256 "825c96f988d8df7d97d5f8b9dedb204e2afcace738b3516b8aedb3e84250ea37"

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
