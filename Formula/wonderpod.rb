class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.10.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.10.0/wonderpod-0.10.0-osx-arm64.tar.gz"
      sha256 "0237840a7d00ce958a9f1d1ab28fd9c06a12ed7ab45d43d77e518a8966408e95"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.10.0/wonderpod-0.10.0-linux-x64.tar.gz"
      sha256 "0bbfe4c2f7c1b1d79f1de89c5a07c1ce7894024d3ed376bebac52a12c01624c4"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
