class Uc < Formula
  desc "Primitive filter to show or clean Unicode artifacts in text"
  homepage "https://github.com/jarpex/uc"
  url "https://github.com/jarpex/uc/releases/download/v1.0.1/uc-1.0.1.tar.gz"
  version "1.0.1"
  sha256 "732c4ded7008aeb888d880d028295daf860c37434bb9d6331e282117dbfd048c"
  license "MIT"
  head "https://github.com/jarpex/uc.git", branch: "main"

  def install
    system "make"
    bin.install "uc"
    man1.install "uc.1"
  end

  test do
    assert_match "usage: uc", shell_output("#{bin}/uc -h 2>&1")
  end
end
