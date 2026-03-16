class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.0/sky10-darwin-arm64"
      sha256 "4d4cd1024e508a3db1db6461875429985a23c53487941ffb567916b39825e3bc"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.0/sky10-darwin-amd64"
      sha256 "831c591810ef2b0f9febf04483c621766d3700e836cf6827ae2b55e84579214f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.0/sky10-linux-arm64"
      sha256 "99c88c8af757a03a8ba61dd25ac5895db34b4068192a0fe4a91711c9f97e0d8c"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.0/sky10-linux-amd64"
      sha256 "7cd9246dd71df36af68d877ae37e50b07d529cb79d02708bcf806e47c8f1aefa"
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
