class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.32.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.32.1/wonderpod-0.32.1-osx-arm64.tar.gz"
      sha256 "93d100cda6b1b43b0d3e41bf08eb722c663949f54ad96ad281e02ca7883436df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.32.1/wonderpod-0.32.1-linux-x64.tar.gz"
      sha256 "4536e68e92349f6954ed7fd8797e64682d24e7658a1fc9f1fd8e4924c95d0201"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
