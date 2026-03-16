class Sky10Cirrus < Formula
  desc "Encrypted file sync for macOS (builds from source)"
  homepage "https://github.com/sky10ai/sky10"
  url "https://github.com/sky10ai/sky10.git", tag: "v0.1.0"
  license "MIT"

  depends_on "go" => :build
  depends_on "xcodegen" => :build
  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
    # Build the Go backend
    system "make", "build"
    bin.install "bin/sky10"

    # Build the Swift app
    cd "cirrus/macos" do
      system "xcodegen", "generate"
      system "xcodebuild",
        "-project", "Cirrus.xcodeproj",
        "-scheme", "Cirrus",
        "-configuration", "Release",
        "-derivedDataPath", buildpath/"DerivedData",
        "CONFIGURATION_BUILD_DIR=#{buildpath}/Build",
        "CODE_SIGNING_ALLOWED=NO"
    end

    prefix.install buildpath/"Build/Cirrus.app"
  end

  def post_install
    # Symlink to /Applications so it shows up in Launchpad
    target = Pathname("/Applications/Cirrus.app")
    source = prefix/"Cirrus.app"
    if source.exist? && !target.exist?
      FileUtils.ln_sf(source, target)
    end
  end

  def caveats
    <<~EOS
      Cirrus.app has been linked to /Applications.

      Note: Cirrus is unsigned. On first launch, right-click → Open
      to bypass Gatekeeper.
    EOS
  end

  test do
    assert_match "sky10", shell_output("#{bin}/sky10 --version")
  end
end
