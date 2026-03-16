class Sky10Cirrus < Formula
  desc "Encrypted file sync for macOS"
  homepage "https://github.com/sky10ai/sky10"
  url "https://github.com/sky10ai/sky10.git", tag: "v0.3.0"
  license "MIT"

  depends_on "sky10ai/tap/sky10"
  depends_on "xcodegen" => :build
  depends_on xcode: ["16.0", :build]
  depends_on :macos

  def install
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

    # Install to the Cellar prefix
    prefix.install buildpath/"Build/Cirrus.app"
  end

  def post_install
    # Copy (not symlink) to /Applications — post_install is unsandboxed
    app_target = Pathname("/Applications/Cirrus.app")
    app_target.rmtree if app_target.exist?
    cp_r prefix/"Cirrus.app", app_target
  end

  def caveats
    <<~EOS
      Cirrus.app has been installed to /Applications.

      Note: Cirrus is unsigned. On first launch, right-click → Open
      to bypass Gatekeeper.
    EOS
  end

  test do
    assert_predicate prefix/"Cirrus.app", :exist?
  end
end
