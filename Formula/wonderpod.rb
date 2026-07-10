class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.37.2"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.37.2/wonderpod-0.37.2-osx-arm64.tar.gz"
      sha256 "1fb9b0155a11e85f0b8363bcaca10ac4c5ff16b9f7fc77cef7ec9362fc6d6e1f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.37.2/wonderpod-0.37.2-linux-x64.tar.gz"
      sha256 "067af75ef0894c9a32a612d4e15cc6a3f499574d9065c09a77a433f2d1303f9e"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
