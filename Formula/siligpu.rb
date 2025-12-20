class Siligpu < Formula
  desc "📊 A minimal Rust-based CLI tool for measuring Apple Silicon GPU usage in snapshot form using IOReport."
  homepage "https://github.com/jarpex/siligpu"
  url "https://github.com/jarpex/siligpu/releases/download/v1.0.0/siligpu" 
  sha256 "b5ccdd74a8474c287c2f581552daede50b1c9a667a421d35b6f8e289aa0a6b3e"
  version "1.0.0"
  license "MIT"

  def install
    bin.install "siligpu"
  end

  test do
    assert_match "siligpu", shell_output("#{bin}/siligpu --version")
  end
end