class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.30.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.30.1/sky10-darwin-arm64"
      sha256 "deee98667571b85f24f37573cd57fe7efb636d9063747ad80df3412d2eaad1bc"
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
