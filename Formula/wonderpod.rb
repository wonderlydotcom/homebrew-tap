class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.61.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.61.0/wonderpod-0.61.0-osx-arm64.tar.gz"
      sha256 "6551f9975e982da740002bc931d5e6d65d93456f991ee7fcf51e50f76972b087"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.61.0/wonderpod-0.61.0-linux-x64.tar.gz"
      sha256 "adfde0f971fcaa13af3510c8b2c86d92266bc4a80effab03840e3b5457b26e5d"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
