cask "micflip" do
  version "0.1.0"
  sha256 "712a5ed844594cfbf4c4d0f06a65cac9a0d06a0c3291524d290af62be94b52f5"

  url "https://github.com/nymann/micflip/releases/download/v#{version}/micflip-#{version}.zip"
  name "micflip"
  desc "Menu-bar mic input toggle"
  homepage "https://github.com/nymann/micflip"

  app "micflip.app"

  zap trash: "~/Library/Preferences/dev.nymann.micflip.plist"

  caveats <<~EOS
    micflip is ad-hoc signed, so Gatekeeper will quarantine it on first launch.
    Clear the quarantine flag once with:

      xattr -dr com.apple.quarantine "#{appdir}/micflip.app"
  EOS
end
