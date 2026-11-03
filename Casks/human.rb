cask "human" do
  version "0.1.0"
  sha256 "1153cf4cbba6d2e8e5104fe86447982fe40a4a472f9389a70f94d449a89e90fe"

  url "https://github.com/jarpex/Human/releases/download/v#{version}/Human.zip"
  name "Human"
  desc "Floating webcam preview window"
  homepage "https://github.com/jarpex/Human"

  depends_on macos: :sonoma

  app "Human.app"

  zap trash: "~/Library/Saved Application State/com.jarpex.human.savedState"
end
