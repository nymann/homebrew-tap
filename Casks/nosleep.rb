cask "nosleep" do
  version "1.0.0"
  sha256 "6b65292d7dec2828fac6e6411ea68f2c658ecb860560ae2aac4cd8d7c668ac8c"

  url "https://github.com/nymann/nosleep/releases/download/v#{version}/nosleep-#{version}.zip"
  name "nosleep"
  desc "Menu-bar caffeinate(1) toggle"
  homepage "https://github.com/nymann/nosleep"

  depends_on macos: ">= :big_sur"

  app "nosleep.app"

  zap trash: "~/Library/LaunchAgents/dev.nymann.nosleep.plist"

  caveats <<~EOS
    nosleep is ad-hoc signed, so Gatekeeper will quarantine it on first launch.
    Clear the quarantine flag once with:

      xattr -dr com.apple.quarantine "#{appdir}/nosleep.app"

    To start nosleep at login, see the `agent-install` recipe in the project's
    justfile: https://github.com/nymann/nosleep
  EOS
end
