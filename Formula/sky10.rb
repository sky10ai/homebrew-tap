class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.31.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.2/sky10-darwin-arm64"
      sha256 "d65d07c1b0c4215f70ac19d2299f117d633297c27f81eb8fa07a365f8c1ecc70"
    elsif Hardware::CPU.intel?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.2/sky10-darwin-amd64"
      sha256 "f8896e4c39804a1a360ac4917d9747c20b1f9defe308ade20c1ad2ce2a8308ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.2/sky10-linux-arm64"
      sha256 "bbf23839944074adee4e9890d72b35e90a1b4946026bdc55ac19b5d03e0eea3b"
    elsif Hardware::CPU.intel?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.2/sky10-linux-amd64"
      sha256 "7db057927ed9dc02ae36b329b52a561c6beac5a0be346a89c5b1c49a83cb98ff"
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
