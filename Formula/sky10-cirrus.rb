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
        "-project", "cirrus.xcodeproj",
        "-scheme", "cirrus",
        "-configuration", "Release",
        "-derivedDataPath", buildpath/"DerivedData",
        "CONFIGURATION_BUILD_DIR=#{buildpath}/Build",
        "CODE_SIGNING_ALLOWED=NO"
    end

    prefix.install buildpath/"Build/cirrus.app"
  end

  def caveats
    <<~EOS
      Cirrus.app has been installed to:
        #{prefix}/cirrus.app

      To open it:
        open #{prefix}/cirrus.app

      Or drag it to /Applications:
        cp -R #{prefix}/cirrus.app /Applications/

      Note: Cirrus is unsigned. On first launch, right-click → Open
      to bypass Gatekeeper.
    EOS
  end

  test do
    assert_match "sky10", shell_output("#{bin}/sky10 --version")
  end
end
