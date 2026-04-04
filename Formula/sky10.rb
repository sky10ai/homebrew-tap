class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.31.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.3/sky10-darwin-arm64"
      sha256 "6d1d887ec1949810d69a66332ab715acb3a24eb1327248c2aec4614624adf21e"
    elsif Hardware::CPU.intel?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.3/sky10-darwin-amd64"
      sha256 "924080c98018c224b74e96f41718874485bdfc806143d4c0907f5c467e259adf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.3/sky10-linux-arm64"
      sha256 "779868a9af433a3f4de7f1ce06f2de9a216e1e9d16c9812baa1718fcab805eca"
    elsif Hardware::CPU.intel?
      url "https://github.com/sky10ai/sky10/releases/download/v0.31.3/sky10-linux-amd64"
      sha256 "231cdae3cd63e94360ebe713c0554e8e5fced5688820fc20d58ee86db0823bd8"
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
