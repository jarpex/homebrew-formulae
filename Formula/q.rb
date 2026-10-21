class Q < Formula
  desc "CLI tool for quick, one-shot Gemini queries with no API key required"
  homepage "https://github.com/jarpex/q"
  version "0.4.0"
  license "MIT"
  head "https://github.com/jarpex/q.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarpex/q/releases/download/v0.4.0/q-macos-apple-silicon.tar.gz"
      sha256 "16ed30c710fd9fbfd1ecb84727b87faf39a7e72576584b63cb4b32eeae4d8aba"
    else
      url "https://github.com/jarpex/q/releases/download/v0.4.0/q-macos-intel.tar.gz"
      sha256 "d68d8e8a2d652792d4ff6fdfb680960a39eccda4455629e8e04391379f9af739"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jarpex/q/releases/download/v0.4.0/q-linux-arm64.tar.gz"
      sha256 "62d20b44d715db93eed99c53211117d90a8160843a5dd9b00973d57d0005c0d6"
    else
      url "https://github.com/jarpex/q/releases/download/v0.4.0/q-linux-amd64.tar.gz"
      sha256 "696d684f79b26b5c8a764c4eb303b882fc24bcec825a1a1ad30e299a87ebfefa"
    end
  end

  def install
    if build.head?
      system "cargo", "install", "--path", ".", "--locked", "--root", staging_prefix
    else
      bin.install "q"
    end
    # The man page came with the release after 0.4.0.
    man1.install "man/q.1" if File.exist?("man/q.1")
  end

  test do
    assert_match "q", shell_output("#{bin}/q --version")
  end
end
