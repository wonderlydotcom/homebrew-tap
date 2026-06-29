class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.21.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.21.1/wonderpod-0.21.1-osx-arm64.tar.gz"
      sha256 "85e01a4ae068118b7d6a92f4b10f74e6bdb23e0faacbd0a64db6b44f031c139d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.21.1/wonderpod-0.21.1-linux-x64.tar.gz"
      sha256 "d3905b56d48f2d8d275565968b00fa2df88dfaf1b31a9b347a48c2be58b1beb9"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
