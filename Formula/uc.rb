class Uc < Formula
  desc "Primitive filter to show or clean Unicode artifacts in text"
  homepage "https://github.com/jarpex/uc"
  url "https://github.com/jarpex/uc/releases/download/v1.0.0/uc-1.0.0.tar.gz"
  version "1.0.0"
  sha256 "4ef785857798620db1b1d2cf0ecf12a9edc125cf5010275544ff6abbe21d4ced"
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
