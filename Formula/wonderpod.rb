class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.13.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.13.0/wonderpod-0.13.0-osx-arm64.tar.gz"
      sha256 "7d0cc0cf38582c4c4890e3cb98eb8ec7bb30ba04c91cf6ff6504f79b7e23c4eb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.13.0/wonderpod-0.13.0-linux-x64.tar.gz"
      sha256 "b9854f712ce94957e57c4fe4bcaa0d90faa3a6545a39d27f2c075d7f872dbaf8"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
