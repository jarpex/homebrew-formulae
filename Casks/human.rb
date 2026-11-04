cask "human" do
  version "1.0.3"
  sha256 "de28923dc9ec702295dd41e0c3a184341592ef8ab1c54e6fea91c71471a3b4f0"

  url "https://github.com/jarpex/Human/releases/download/v#{version}/Human.zip"
  name "Human"
  desc "Floating webcam preview window"
  homepage "https://github.com/jarpex/Human"

  depends_on macos: :sonoma

  app "Human.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-r", "-d", "com.apple.quarantine", "{{appdir}}/Human.app"]
  end

  zap trash: "~/Library/Saved Application State/com.jarpex.human.savedState"
end
