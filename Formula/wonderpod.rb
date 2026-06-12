class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.3.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.3.1/wonderpod-0.3.1-osx-arm64.tar.gz"
      sha256 "61a4b57c6af5df729b6096b8098c7680c01f4887996c680b0e8835bd210a6a8e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.3.1/wonderpod-0.3.1-linux-x64.tar.gz"
      sha256 "8098b65eea9b03071a78563ff026b66f1c46ed27bcb65d520bf1e50b3067ff57"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
