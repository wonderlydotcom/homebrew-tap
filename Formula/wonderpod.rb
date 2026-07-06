class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.32.3"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.32.3/wonderpod-0.32.3-osx-arm64.tar.gz"
      sha256 "1f827dfe00388399b88838e220e2d46087d3263ab9d386725fa5d7257963ce28"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.32.3/wonderpod-0.32.3-linux-x64.tar.gz"
      sha256 "76d8a742288ebbab103e70e0042d5648586f7dce98d2be386d85f7d611b1b47f"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
