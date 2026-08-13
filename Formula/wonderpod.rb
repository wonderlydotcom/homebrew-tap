class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.79.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.79.0/wonderpod-0.79.0-osx-arm64.tar.gz"
      sha256 "a181b5efbc7381a61673b655aff3522ed65422c28a32209f0063da1741172fb9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.79.0/wonderpod-0.79.0-linux-x64.tar.gz"
      sha256 "3092bba48709d6ca1f6f1fd6bda5f441dec2452f33fcf33515fa37a9751045da"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
