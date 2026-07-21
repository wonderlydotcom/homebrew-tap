class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.49.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.49.1/wonderpod-0.49.1-osx-arm64.tar.gz"
      sha256 "5627725553dcf4777df3ec45d71239fbd46dc22e8f2d15709da0429f3d9f38a8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.49.1/wonderpod-0.49.1-linux-x64.tar.gz"
      sha256 "276aab01c32d4b686f8b3085153a182c67e33d18e033719fbb86a136c30fa9b0"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
