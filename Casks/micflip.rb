cask "micflip" do
  version "0.2.0"
  sha256 "aa1275f615292f34eb4a2af00d642856517d0d1d7a159231474aa315e2429222"

  url "https://github.com/nymann/micflip/releases/download/v#{version}/micflip-#{version}.zip"
  name "micflip"
  desc "Menu-bar mic input toggle"
  homepage "https://github.com/nymann/micflip"

  depends_on macos: ">= :tahoe"

  app "micflip.app"
  binary "#{appdir}/micflip.app/Contents/MacOS/micflip"

  zap trash: "~/Library/Preferences/dev.nymann.micflip.plist"

  caveats <<~EOS
    micflip is ad-hoc signed, so Gatekeeper will quarantine it on first launch.
    Clear the quarantine flag once with:

      xattr -dr com.apple.quarantine "#{appdir}/micflip.app"
  EOS
end
