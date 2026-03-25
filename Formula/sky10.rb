class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.16.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.16.1/sky10-darwin-arm64"
      sha256 "ecb52956590d0a754d8d882c22944dab9ca895eed925ece9ea2205b0b11a7e44"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.2/sky10-darwin-amd64"
      sha256 "af2c1f7a71150263828f9feec6dcc88ac4f147863ab66bb50239dbac3a9aa1b9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.2/sky10-linux-arm64"
      sha256 "887cf93dc4a97c4c3e1c317db3540.8.1b4ccc9c15362b84e68311d2a32b328e"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.2/sky10-linux-amd64"
      sha256 "4bd23af461b2f27d34e44325d0b419a45c20f0.8.17757e495389c5394114fe9"
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
