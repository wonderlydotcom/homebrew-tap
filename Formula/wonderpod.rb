class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.44.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.44.1/wonderpod-0.44.1-osx-arm64.tar.gz"
      sha256 "6ac3ea7c7b56995ae4a6c6bf3f00b1b45dfea83d04da6ac4828404f9c3fd51d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.44.1/wonderpod-0.44.1-linux-x64.tar.gz"
      sha256 "57308689bb635983d4c92b365523fedf702af9e3396cc165c86fd996f0582172"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
