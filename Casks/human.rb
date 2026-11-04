cask "human" do
  version "1.0.2"
  sha256 "d2f67b5bfe84a08dadf0a017bd9267b6332c09daee148374ac8be6f332a39d1d"

  url "https://github.com/jarpex/Human/releases/download/v#{version}/Human.zip"
  name "Human"
  desc "Floating webcam preview window"
  homepage "https://github.com/jarpex/Human"

  depends_on macos: ">= :sonoma"

  app "Human.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-r", "-d", "com.apple.quarantine", "#{appdir}/Human.app"]
  end

  zap trash: "~/Library/Saved Application State/com.jarpex.human.savedState"
end
