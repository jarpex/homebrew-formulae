class Uc < Formula
  desc "Primitive filter to show or clean Unicode artifacts in text"
  homepage "https://github.com/jarpex/uc"
  head "https://github.com/jarpex/uc.git", branch: "main"

  license "MIT"

  def install
    system "make"
    bin.install "uc"
  end

  test do
    assert_match "usage: uc", shell_output("#{bin}/uc -h 2>&1")
  end
end
