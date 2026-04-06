class Framehero < Formula
  desc "Automate App Store screenshot capture across locales from the command line"
  homepage "https://github.com/gunnargray-dev/framehero-cli"
  url "https://github.com/gunnargray-dev/framehero-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "1e1a0959deeb7f44c91c9c7ff2e21d2c522c1f005d175ff5fed3fc6a18edc2b5"
  license "MIT"

  depends_on xcode: ["15.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"

    bin.install ".build/release/framehero"

    # Install the resource bundle (device frame assets) alongside the binary.
    # SPM places it under the arch-specific build directory.
    bundles = Dir[".build/*-apple-macosx/release/framehero-cli_framehero.bundle"]
    if bundles.any?
      bin.install bundles.first => "framehero-cli_framehero.bundle"
    end
  end

  test do
    assert_match "Automate App Store screenshot capture", shell_output("#{bin}/framehero --help")
  end
end
