class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.27.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.27.0/wonderpod-0.27.0-osx-arm64.tar.gz"
      sha256 "f9ccf85c91cb46081bdadfcb1b2b46b6a2e1eef90c5d4839355976cc4eb7a09e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.27.0/wonderpod-0.27.0-linux-x64.tar.gz"
      sha256 "b8311a708c7517cb7045db1168b76547187ec243301bdead3e1886b885f16aed"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
