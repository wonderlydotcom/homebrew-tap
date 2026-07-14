class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.39.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.39.0/wonderpod-0.39.0-osx-arm64.tar.gz"
      sha256 "a01abb5cb32f81be623bc3d373ab5ebd0dcb3572897182ed96a3a23bb4cc9c81"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.39.0/wonderpod-0.39.0-linux-x64.tar.gz"
      sha256 "b03b20f1a5cce16af027fa6a7f981bff9faea2c788e12461aff5cfe85a5e0d6d"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
