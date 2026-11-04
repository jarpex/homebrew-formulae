cask "human" do
  version "1.0.2"
  sha256 "de028653e6ef109f094198cb8d85f479a71618d7ea78095defffc56a607e3bb7"

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
