class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.19.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.19.0/wonderpod-0.19.0-osx-arm64.tar.gz"
      sha256 "6d8153af6148bf9a823736837de0b2937f09f318e0cc84bb7d172d7b4813ffc5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.19.0/wonderpod-0.19.0-linux-x64.tar.gz"
      sha256 "ca6f927b6f295f6b7bfb01d6891cb186832974d34b61de4af65df2191e323c17"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
