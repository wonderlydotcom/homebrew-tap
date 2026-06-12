class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.2.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.2.0/wonderpod-0.2.0-osx-arm64.tar.gz"
      sha256 "8faa8065ee23c503d7364f95d40349ca5a21b700ce2f28cab9c011bc30c7e536"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.2.0/wonderpod-0.2.0-linux-x64.tar.gz"
      sha256 "6394d03b2c95f3f156a7d09488912dd93e76d6ddeab4ea180ae2d70c270bfb3d"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
