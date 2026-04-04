class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.31.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.1/sky10-darwin-arm64"
      sha256 "f8eeec87dd7f0f6e223630e31c251f268dcda8bd79304f7e23e4247d65ead1dc"
    elsif Hardware::CPU.intel?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.1/sky10-darwin-amd64"
      sha256 "fb643f601c6f031df14f80d70855ca2a5b7e56020022638a74526270c70f8038"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.1/sky10-linux-arm64"
      sha256 "6cf9eba831e8993287f9c69dd80dd6ddcee38baf285cf2e90f67096949eb7f3b"
    elsif Hardware::CPU.intel?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.1/sky10-linux-amd64"
      sha256 "bcb0a8ced09acf989bb3e63d0c6a0ad4b9f6dfcdaa74a5514e0e03136c39e913"
    end
  end

  def install
    binary = Dir["sky10-*"].first || "sky10"
    bin.install binary => "sky10"
  end

  test do
    assert_match "sky10", shell_output("#{bin}/sky10 --version")
  end
end
