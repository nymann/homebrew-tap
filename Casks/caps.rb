cask "caps" do
  version "1.0.0"
  sha256 "529a3c3b81658014b52749f4b26ff1a95a71a39bd8e94b7af0e81d33a3bb8cba"

  url "https://github.com/nymann/caps/releases/download/v#{version}/caps-#{version}.zip"
  name "caps"
  desc "Hyperkey replacement: Caps Lock as Hyper (held) / Escape (tapped)"
  homepage "https://github.com/nymann/caps"

  depends_on macos: ">= :ventura"

  app "caps.app"

  zap trash: [
    "~/Library/LaunchAgents/dev.nymann.caps.plist",
    "~/Library/LaunchAgents/dev.nymann.caps.remap.plist",
  ]

  caveats <<~EOS
    caps is signed with a local self-signed identity, so Gatekeeper will
    quarantine it on first launch. Clear the quarantine flag once with:

      xattr -dr com.apple.quarantine "#{appdir}/caps.app"

    caps needs Accessibility permission (CGEventTap) and a hidutil remap
    to be useful. See the README for the LaunchAgent setup that runs both
    the remap and caps at login: https://github.com/nymann/caps
  EOS
end
