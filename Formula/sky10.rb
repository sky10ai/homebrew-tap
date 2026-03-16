class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.2.0/sky10-darwin-arm64"
      sha256 "2e8b783a1c5c5cd2c6b01231b33ade826f87c5f2fdedf8bb3aadcec425d40f68"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.2.0/sky10-darwin-amd64"
      sha256 "8bb185b0ca65159d2e1e801f67ed0e8b323b5af2c23d7a37e6993dc5541c08bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.2.0/sky10-linux-arm64"
      sha256 "c851688ff94fb5cfdfdd55a73e46746d0b6456cf03189cb2912b45a3cfd08a0d"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.2.0/sky10-linux-amd64"
      sha256 "6c3c088a25dd90d6a1183c510851d835c87246319c0cbaa599e3f7a925c53fbf"
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
