class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.34.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.34.0/wonderpod-0.34.0-osx-arm64.tar.gz"
      sha256 "868609c1a8d86d5bdb2c928915b0f7ecae4641e74694a89ebf42db66cbe5605a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.34.0/wonderpod-0.34.0-linux-x64.tar.gz"
      sha256 "cfb75ef01ca86e57eb3dce1a35db0c0eac6c8c826a35f4aac7accbe7b25d6f44"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
