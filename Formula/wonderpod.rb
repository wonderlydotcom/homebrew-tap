class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.32.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.32.0/wonderpod-0.32.0-osx-arm64.tar.gz"
      sha256 "d922cb00f0d274db12213c78ed9aeb6307f820af3971afe47a4d44c6a67c9bd0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.32.0/wonderpod-0.32.0-linux-x64.tar.gz"
      sha256 "b2940694e4f4824571bcaa16dafafd9be00aba7ed9baa262153815801f0095f7"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
