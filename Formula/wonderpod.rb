class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.74.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.74.0/wonderpod-0.74.0-osx-arm64.tar.gz"
      sha256 "d05299d800baa0fc2f21eeb09e17e8d7655a0c0379a7608aa5d6401cd2279358"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.74.0/wonderpod-0.74.0-linux-x64.tar.gz"
      sha256 "c8a520f18a9d2955a7ef266621d95d70b7546a8616813b4e9bedb656d7efafd5"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
