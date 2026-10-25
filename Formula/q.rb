class Q < Formula
  desc "CLI tool for quick, one-shot Gemini queries with no API key required"
  homepage "https://github.com/jarpex/q"
  version "0.5.0"
  license "MIT"
  head "https://github.com/jarpex/q.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarpex/q/releases/download/v0.5.0/q-macos-apple-silicon.tar.gz"
      sha256 "7f49caebcdbfae2aeefa9ab658e9726bd143a66c14ed59c54cec71b9f17ca9e8"
    else
      url "https://github.com/jarpex/q/releases/download/v0.5.0/q-macos-intel.tar.gz"
      sha256 "0313bead4fb2ad185191df6b8db5fc6f83231777366c2c89c9ad4d839c7f129b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jarpex/q/releases/download/v0.5.0/q-linux-arm64.tar.gz"
      sha256 "2a208d898719f9d64812ce4e71d47cb11b6fc2a8afe13ed00f8fa87b04513024"
    else
      url "https://github.com/jarpex/q/releases/download/v0.5.0/q-linux-amd64.tar.gz"
      sha256 "d365509fc93fbb1f696688d17a462ff6866341b3b25076c08f1858bb066b67b4"
    end
  end

  def install
    if build.head?
      system "cargo", "install", "--path", ".", "--locked", "--root", prefix
    else
      bin.install "q"
    end
    # The man page came with the release after 0.4.0.
    man1.install "man/q.1"
  end

  def caveats
    old_man = File.expand_path("~/.local/share/man/man1/q.1")
    return unless File.exist?(old_man)

    <<~EOS
      A manually installed man page at ~/.local/share/man/man1/q.1 takes
      precedence over the Homebrew one and may be out of date. Remove it:
        rm ~/.local/share/man/man1/q.1
    EOS
  end

  test do
    assert_match "q", shell_output("#{bin}/q --version")
  end
end
