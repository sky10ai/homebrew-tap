class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.1.0/sky10-darwin-arm64"
      sha256 "3244c11f50501c0fc5211e71eab3521b4ced874f7176c76bce0421559cf928a5"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.1.0/sky10-darwin-amd64"
      sha256 "847cfdbdd77f6acc26df39af372936d67362594eadc0c6e2f30357ca632ae351"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.1.0/sky10-linux-arm64"
      sha256 "ba7338fb98d75b5bfe6c46ebb7bb360c43b4e02f8fec1a6679fb219c16e83552"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.1.0/sky10-linux-amd64"
      sha256 "ed632388a7b2956561656bc02ef3ed89e4e8f8ccdd5f5182deb9e2b7e45663d7"
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
