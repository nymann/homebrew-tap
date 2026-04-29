cask "hidecursor" do
  version "1.0.0"
  sha256 "5fb0636d4c0c26a31fa10a576f4472262e03a02bdc5d316eaaf8bb9741b5e07b"

  url "https://github.com/nymann/hidecursor/releases/download/v#{version}/hidecursor-#{version}.zip"
  name "hidecursor"
  desc "Hide cursor when idle (background daemon)"
  homepage "https://github.com/nymann/hidecursor"

  depends_on macos: ">= :big_sur"

  app "hidecursor.app"

  zap trash: "~/Library/LaunchAgents/dev.nymann.hidecursor.plist"

  caveats <<~EOS
    hidecursor is ad-hoc signed, so Gatekeeper will quarantine it on first launch.
    Clear the quarantine flag once with:

      xattr -dr com.apple.quarantine "#{appdir}/hidecursor.app"

    hidecursor needs Accessibility permission to monitor mouse activity;
    macOS will prompt on first run.

    To start hidecursor at login, see the `agent-install` recipe in the
    project's justfile: https://github.com/nymann/hidecursor
  EOS
end
