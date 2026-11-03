cask "human" do
  version "0.1.0"
  sha256 "f46dc39a799de80718dfd1d9a5b7ff230559eb5833cd64860cb6c5277ebdb2a8"

  url "https://github.com/jarpex/Human/releases/download/v#{version}/Human.zip"
  name "Human"
  desc "Floating webcam preview window"
  homepage "https://github.com/jarpex/Human"

  depends_on macos: :sonoma

  app "Human.app"

  zap trash: "~/Library/Saved Application State/com.jarpex.human.savedState"
end
