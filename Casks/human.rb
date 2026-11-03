cask "human" do
  version "1.0.0"
  sha256 "77bc38b5a33e0a01dc20603ad6d8abd407c6a0ffcb0d8264c4b654ebc945929c"

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
