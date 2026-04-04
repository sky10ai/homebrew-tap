class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.31.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.0/sky10-darwin-arm64"
      sha256 "211a9d8d1a6b734ec4e45a90c2067885a76a9a7ce531b43788f4449684de9cdf"
    elsif Hardware::CPU.intel?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.0/sky10-darwin-amd64"
      sha256 "0e0f98a9f355c48c2053fe2e59fef123202ffb8b6cda7d36699f883c58df09b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.0/sky10-linux-arm64"
      sha256 "dcf899a6a83168061d1829be194c1d52a7c82c902b33ed599150e7e7b3324e51"
    elsif Hardware::CPU.intel?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.0/sky10-linux-amd64"
      sha256 "a8473df72357b79d8a1132086d0d345afa65bc8177cae8bbef25b9ebcda47cb5"
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
