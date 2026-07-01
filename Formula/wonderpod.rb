class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.24.3"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.3/wonderpod-0.24.3-osx-arm64.tar.gz"
      sha256 "7e6943d24c1d1133e82a02aed16a94a4faae187537deefd0f2a51eba4c15a0f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.3/wonderpod-0.24.3-linux-x64.tar.gz"
      sha256 "ef7df32eefe73fa699629c5330c4dfd33a02e913874e005c452230451c0687fd"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
