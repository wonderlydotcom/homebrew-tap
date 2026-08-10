class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.75.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.75.0/wonderpod-0.75.0-osx-arm64.tar.gz"
      sha256 "4143773322558e780eef5776f60c73b2b360e74e44ef9e4c08120dbdc98ca741"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.75.0/wonderpod-0.75.0-linux-x64.tar.gz"
      sha256 "bd7e9c8699b72875938805889ec3de7825e14ae209cc5ee65bc3d05c192d568a"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
