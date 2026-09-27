class Siligpu < Formula
  desc "Minimal Rust-based CLI tool for measuring Apple Silicon GPU usage in snapshot form using IOReport"
  homepage "https://github.com/jarpex/siligpu"
  url "https://github.com/jarpex/siligpu/releases/download/v1.1.0/siligpu"
  sha256 "0fca0398401fc679dc577b880e169faec782100e07a5017e62a5753a1a514233"
  version "1.1.0"
  license "MIT"

  resource "man_page" do
    url "https://raw.githubusercontent.com/jarpex/siligpu/v1.1.0/man/siligpu.1"
    sha256 "1d73cbf748a6975339784a9189d5640650baebe492d60b25f0e4e4a66f74f540"
  end

  def install
    bin.install "siligpu"
    resource("man_page").stage do
      man1.install "siligpu.1"
    end
  end

  test do
    assert_match "siligpu", shell_output("#{bin}/siligpu --version")
  end
end