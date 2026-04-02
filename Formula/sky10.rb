class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.30.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.30.0/sky10-darwin-arm64"
      sha256 "991862686ff86284651b4e482a03c985370724397f3c254d48bac66b759ef63c"
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
