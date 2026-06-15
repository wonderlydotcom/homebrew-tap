class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.8.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.8.0/wonderpod-0.8.0-osx-arm64.tar.gz"
      sha256 "de8b361dc1e7b73aaa8c5c1abc49754a666ff899a45339bf471a33569d66f6c3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.8.0/wonderpod-0.8.0-linux-x64.tar.gz"
      sha256 "28ceb789407f4eafa5eae76cbf5de22bb6a2c30fea975d5d1216b67fda19e9af"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
