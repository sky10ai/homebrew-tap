class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.28.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.28.1/sky10-darwin-arm64"
      sha256 "606487fe83e7441695ff74d4d54f8a442dbd58b32a120e2986dea10108d4b177"
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
