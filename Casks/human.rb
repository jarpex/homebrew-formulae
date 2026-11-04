cask "human" do
  version "1.0.2"
  sha256 "8073b3869d8dcd8c202571100f8291ab66befd9842e73c16e063a0cb809ba3f3"

  url "https://github.com/jarpex/Human/releases/download/v#{version}/Human.zip"
  name "Human"
  desc "Floating webcam preview window"
  homepage "https://github.com/jarpex/Human"

  depends_on macos: ">= :sonoma"

  app "Human.app"

  caveats <<~EOS
    #{token} is ad-hoc signed. If macOS Gatekeeper blocks it, run:
      xattr -d com.apple.quarantine "#{appdir}/Human.app"
    Or install with:
      brew install --cask --no-quarantine jarpex/formulae/human
  EOS

  zap trash: "~/Library/Saved Application State/com.jarpex.human.savedState"
end
