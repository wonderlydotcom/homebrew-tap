class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.41.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.41.0/wonderpod-0.41.0-osx-arm64.tar.gz"
      sha256 "d5f627c9c7ff93a94f288b4d365dbf7c2d7679abff8071f988d5b22d62ef7c0a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.41.0/wonderpod-0.41.0-linux-x64.tar.gz"
      sha256 "fc2977805b96739be4395121c16d13a06f81d9d22fdabcff0108b237d80135d8"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
