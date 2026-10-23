cask "sixty" do
  version "0.1.2"
  sha256 "a3f6f377a600fd0d0d924c2aa3f4407e24db6f4b4231a5f690553fddf7223031"

  url "https://github.com/leplik/sixty/releases/download/v#{version}/Sixty-#{version}.dmg"
  name "Sixty"
  desc "Locks the screen for a 60-second stand-up break every hour, but never in a call"
  homepage "https://leplik.github.io/sixty/"

  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Sixty.app"

  uninstall launchctl: "pro.saac.sixty.agent",
            quit:      "pro.saac.sixty"

  zap trash: [
    "~/Library/Application Support/Sixty",
    "~/Library/Preferences/pro.saac.sixty.plist",
  ]
end
