class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.26.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.26.0/wonderpod-0.26.0-osx-arm64.tar.gz"
      sha256 "197c782b5834c78feb9876583d0f8358cb2b31cdf3b731cce86650f73d0afa87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.26.0/wonderpod-0.26.0-linux-x64.tar.gz"
      sha256 "b88c0de213b7bd17d2fbed2690a6839ab7430b363c17271392d9f5538e995e30"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
