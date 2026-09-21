class Lumen < Formula
  desc "Stream your display to browsers on the LAN"
  homepage "https://github.com/flaviodelgrosso/lumen"
  url "https://github.com/flaviodelgrosso/lumen/releases/download/v0.1.8/lumen-v0.1.8-aarch64-apple-darwin.tar.gz"
  sha256 "41b294dc4a86cda1d1d3a7aef919042254931dd4fbd7fedd28c5db8eb0034b78"
  license "MIT"

  depends_on arch: :arm64
  depends_on macos: :ventura

  def install
    bin.install "lumen"
  end

  test do
    assert_match "lumen #{version}", shell_output("#{bin}/lumen --version")
  end
end
