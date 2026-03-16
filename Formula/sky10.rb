class Sky10 < Formula
  desc "Encrypted storage & agent coordination"
  homepage "https://github.com/sky10ai/sky10"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.1/sky10-darwin-arm64"
      sha256 "a12a1a7603a6f9992ca11e82435a4b787df3b9edfe747d6d163434b9bcaa1982"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.1/sky10-darwin-amd64"
      sha256 "5ea2c6240202ebb67d36f5fe3311468c59fbcfc039e7f8365dad0e03eac3beb9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.1/sky10-linux-arm64"
      sha256 "6cd147f0524e1a9c690f69ba7533c364bde541f84d9982afe13c785e3e588505"
    else
      url "https://github.com/sky10ai/sky10/releases/download/v0.4.1/sky10-linux-amd64"
      sha256 "f9a17e68de73541c5428c58e6772f0030a76ab06a43238fed2610a8d6f9964ea"
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
