class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.26.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.26.0/sky10-darwin-arm64"
      sha256 "e3ee4a4eafdd915b926f721ab1c38b84ef9643ee69b2eccfe82c763854d2c411"
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
