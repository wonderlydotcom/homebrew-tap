class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.58.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.58.0/wonderpod-0.58.0-osx-arm64.tar.gz"
      sha256 "b67634f073d5dbcc6ec04d22c449003a5760d466ca8b57d53d286a2dbb9b1476"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.58.0/wonderpod-0.58.0-linux-x64.tar.gz"
      sha256 "27071e953a881e2ce22f492ae9881a16f4cff2d2f3bd78887f670b01faebcb07"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
