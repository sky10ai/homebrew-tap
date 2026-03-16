class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.3.0/sky10-darwin-arm64"
      sha256 "a39217231258453f3789b46b6b3ec1cee96ab4dba09bd6d85a6c379079bb99f5"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.3.0/sky10-darwin-amd64"
      sha256 "e752882112fdded282b1af84000d14650a4734ded5716eda2f3870bbaf7f08b5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.3.0/sky10-linux-arm64"
      sha256 "520adecb3d75ccab1ba4845bcfcfab1291d3263975ee08764624483c4b44ece0"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.3.0/sky10-linux-amd64"
      sha256 "02638923a42b07cd7d11d5dd45ddfb7f4502b4b1d42dac282ca6f1727257f9e5"
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
