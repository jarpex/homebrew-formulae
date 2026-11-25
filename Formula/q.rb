class Q < Formula
  desc "CLI tool for quick, one-shot Gemini queries with no API key required"
  homepage "https://github.com/jarpex/q"
  version "0.5.1"
  license "MIT"
  head "https://github.com/jarpex/q.git", branch: "main"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/jarpex/q/releases/download/v0.5.1/q-macos-apple-silicon.tar.gz"
      sha256 "cb4770e32ba30cafe71c11f6ef4f8f5cbfb2963eda9e258e5dc1c0e0020dbcdb"
    else
      url "https://github.com/jarpex/q/releases/download/v0.5.1/q-macos-intel.tar.gz"
      sha256 "ff2f53f0bc7b7c81f65431477cb9daedd723f1174a5a9ba115c64b755cd6bf2e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/jarpex/q/releases/download/v0.5.1/q-linux-arm64.tar.gz"
      sha256 "864f515dccd48bd60c5b479ee8c90739c757b9887178416878f38ea8515ec996"
    else
      url "https://github.com/jarpex/q/releases/download/v0.5.1/q-linux-amd64.tar.gz"
      sha256 "f2e0b3eaaad3760a0d7aba3c30ce54606043b9ba37784ef5d10510699d750a2e"
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
