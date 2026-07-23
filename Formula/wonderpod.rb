class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.54.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.54.0/wonderpod-0.54.0-osx-arm64.tar.gz"
      sha256 "681c9ef4e4758b49c59c910bfc7881c6c23c4cf726bb3a6551bb9cdababf7d43"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.54.0/wonderpod-0.54.0-linux-x64.tar.gz"
      sha256 "d68f0f9013f42066cf5c96d78d7c7f007f3ef53d2b15e54f418b3abb7664797a"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
