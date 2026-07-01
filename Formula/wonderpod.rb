class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.24.2"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.2/wonderpod-0.24.2-osx-arm64.tar.gz"
      sha256 "1a153b137c1775b26cdd6e37c5a1cc252e094ffa324da56ef7cefe161d7ab736"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.2/wonderpod-0.24.2-linux-x64.tar.gz"
      sha256 "b61b423c6bcf6146f49a6b4a95ff01ab8a0a3a6efa59f3b3eaf7e6618e2be8b4"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
