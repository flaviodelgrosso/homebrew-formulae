class Mactl < Formula
  desc "Manage local macOS virtual machines on Apple Silicon"
  homepage "https://github.com/flaviodelgrosso/mactl"
  license "GPL-3.0-or-later"

  head "https://github.com/flaviodelgrosso/mactl.git", branch: "main"

  depends_on "rust" => :build
  depends_on arch: :arm64
  depends_on macos: :monterey

  def install
    system "cargo", "install", "--locked", "--path", "mactl-cli", "--root", prefix

    rm Dir[prefix/".crates*"]

    system "/usr/bin/codesign", "--force", "--sign", "-",
           "--entitlements", "packaging/entitlements.plist", bin/"mactl"
  end

  test do
    assert_match "mactl", shell_output("#{bin}/mactl --version")

    entitlements = shell_output("/usr/bin/codesign -d --entitlements :- #{bin}/mactl 2>&1")
    assert_match "com.apple.security.virtualization", entitlements
  end
end
