cask "tg-granola-autorecord" do
  version "1.0.0"
  sha256 "d5fe7957e1d57d08c47f1617e78a0bd865c07fae038c43bba58f54306e8e6da5"

  url "https://github.com/leplik/tg-granola-autorecord/releases/download/v#{version}/tg-granola-autorecord-#{version}.zip"
  name "Telegram-Granola Autorecord"
  desc "Record Telegram calls in Granola automatically"
  homepage "https://github.com/leplik/tg-granola-autorecord"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Telegram-Granola Autorecord.app"
  command_wrapper "tg-granola-autorecord",
                  executable: "#{appdir}/Telegram-Granola Autorecord.app/Contents/MacOS/tg-granola-autorecord"

  uninstall quit: "pro.saac.tg-granola-autorecord"

  zap trash: [
    "~/.config/tg-granola-autorecord",
    "~/Library/Application Support/tg-granola-autorecord",
    "~/Library/Logs/tg-granola-autorecord.log",
    "~/Library/Logs/tg-granola-autorecord.log.1",
    "~/Library/Preferences/pro.saac.tg-granola-autorecord.plist",
  ]

  caveats <<~EOS
    Open Telegram-Granola Autorecord once to turn it on and allow Accessibility access,
    so recordings stop when calls end. Check the setup with:
      tg-granola-autorecord doctor

    Before uninstalling, run `tg-granola-autorecord disable` to remove its login item.
  EOS
end
