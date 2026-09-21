class Lumen < Formula
  desc "Stream your display to browsers on the LAN"
  homepage "https://github.com/flaviodelgrosso/lumen"
  url "https://github.com/flaviodelgrosso/lumen/releases/download/v0.1.7/lumen-v0.1.7-aarch64-apple-darwin.tar.gz"
  sha256 "4bb11e78026f7f8a7d3e40f72983420ac7aee9e7d378416a654384b90edf182c"
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
