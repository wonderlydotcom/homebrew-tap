class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.18.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.18.1/wonderpod-0.18.1-osx-arm64.tar.gz"
      sha256 "0e396306bffe01c0770657bf2cea3ae12c3311440c0472ae10068f93e3fdb2f6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.18.1/wonderpod-0.18.1-linux-x64.tar.gz"
      sha256 "65a43c18c36f76f33536c24d6920ca9d3d616989659c7f6433b8e3ae38f2dccb"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
