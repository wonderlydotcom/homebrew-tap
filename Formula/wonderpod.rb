class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.31.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.31.0/wonderpod-0.31.0-osx-arm64.tar.gz"
      sha256 "2b53bd0c682fa319726afdc750cc1b69706678aa6d95e8bcd428bb7191633a7e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.31.0/wonderpod-0.31.0-linux-x64.tar.gz"
      sha256 "749138f98bada4fdc4b1f5efc290d3befe08c91c0d68275fd53f59bec0d9ddff"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
