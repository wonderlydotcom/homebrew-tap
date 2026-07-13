class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.38.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.38.0/wonderpod-0.38.0-osx-arm64.tar.gz"
      sha256 "06a86146e04b2e0049d2e288f254877651fefc15595ef745a7c276d62456b2d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.38.0/wonderpod-0.38.0-linux-x64.tar.gz"
      sha256 "24f2f98e672b57a60228ac461621814418fac1a0643ff663ac9c78172da54050"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
