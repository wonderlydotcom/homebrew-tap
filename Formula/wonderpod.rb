class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.22.3"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.22.3/wonderpod-0.22.3-osx-arm64.tar.gz"
      sha256 "8a0231ed6ca0dbe936cc7d0a982e93aba6f5ae20268545f43dcd53d53919e48a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.22.3/wonderpod-0.22.3-linux-x64.tar.gz"
      sha256 "17be15c0baaa6e574aee61b5e46b9e964490173acb73eaac6d1fe361de437eae"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
