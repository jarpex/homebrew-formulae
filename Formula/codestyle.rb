class Codestyle < Formula
  desc "Personal code style checker for Zig and C99 with SARIF output"
  homepage "https://github.com/jarpex/codestyle"
  url "https://github.com/jarpex/codestyle.git",
      revision: "35abf69e707f9eed3798cea4ee2269114ec725a4"
  version "1.0.0"
  license "BSD-3-Clause"
  head "https://github.com/jarpex/codestyle.git", branch: "main"

  depends_on "zig" => :build

  def install
    system "zig", "build", *std_zig_args
  end

  test do
    assert_match "Usage: codestyle", shell_output("#{bin}/codestyle --help")
  end
end
