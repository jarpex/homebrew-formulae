class Uc < Formula
  desc "Primitive filter to show or clean Unicode artifacts in text"
  homepage "https://github.com/jarpex/uc"
  url "https://github.com/jarpex/uc/releases/download/v1.0.2/uc-1.0.2.tar.gz"
  version "1.0.2"
  sha256 "c32431219cb67ae2f9b9c61ae5b651cf1805227854b04b7df9f04f938e82d8c1"
  license "MIT"
  head "https://github.com/jarpex/uc.git", branch: "main"

  def install
    system "make"
    bin.install "uc"
    man1.install "uc.1"
  end

  def caveats
    paths = ["/usr/local/share/man/man1/uc.1", File.expand_path("~/.local/share/man/man1/uc.1")]
    existing = paths.select { |p| File.exist?(p) }
    return if existing.empty?

    <<~EOS
      A manually installed man page takes precedence over the Homebrew one
      and may be out of date. Remove it:
      #{existing.map { |p| "  rm #{p}" }.join("\n")}
    EOS
  end

  test do
    assert_match "usage: uc", shell_output("#{bin}/uc -h 2>&1")
  end
end
