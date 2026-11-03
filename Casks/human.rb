cask "human" do
  version "1.0.0"
  sha256 "f1f6f6a81b01ace402402a460557728545c90af303b67f5e7eae1fdba6f65714"

  url "https://github.com/jarpex/Human/releases/download/v#{version}/Human.zip"
  name "Human"
  desc "Floating webcam preview window"
  homepage "https://github.com/jarpex/Human"

  depends_on macos: :sonoma

  app "Human.app"

  postflight_steps do
    run "/usr/bin/xattr", "-d", "com.apple.quarantine", "#{appdir}/Human.app"
  end

  zap trash: "~/Library/Saved Application State/com.jarpex.human.savedState"
end
