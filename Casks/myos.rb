# Activate when the first signed release is available.
# See: https://github.com/gunnargray-dev/myOS/blob/main/docs/release/SIGNING.md
#
# To update:
#   1. Update `version` to the new release tag (without 'v')
#   2. Download the .dmg and run: shasum -a 256 myOS-VERSION.dmg
#   3. Update `sha256` with the output
#   4. Test: brew install --cask gunnargray-dev/tap/myos

cask "myos" do
  version "TODO"
  sha256 "TODO"

  url "https://github.com/gunnargray-dev/myOS/releases/download/v#{version}/myOS-#{version}.dmg"
  name "myOS"
  desc "Control plane for running multiple AI agents in parallel"
  homepage "https://github.com/gunnargray-dev/myOS"

  # TODO: uncomment when notarization is set up
  # depends_on macos: ">= :sonoma"

  app "myOS.app"

  zap trash: [
    "~/Library/Application Support/app.myos.myOS",
    "~/Library/Caches/app.myos.myOS",
    "~/Library/Preferences/app.myos.myOS.plist",
  ]
end
