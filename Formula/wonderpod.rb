class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.48.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.48.0/wonderpod-0.48.0-osx-arm64.tar.gz"
      sha256 "374d3c40fe8e6a550cdcd52408c21d55ef0ca5c54ebb1e878f39e0b6cd8dc5f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.48.0/wonderpod-0.48.0-linux-x64.tar.gz"
      sha256 "7134bff2a14b22a02730483d1fab481749be711bbc1efa87b46e5f41325f2799"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
