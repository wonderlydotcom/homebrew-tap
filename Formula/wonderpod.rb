class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.6.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.6.0/wonderpod-0.6.0-osx-arm64.tar.gz"
      sha256 "834f134bb2d61b2e2f6b2c86a0944f685819323e7f936feebfe772c0656a9a26"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.6.0/wonderpod-0.6.0-linux-x64.tar.gz"
      sha256 "b44fab861276faf4de440d6a767b6bb5f7df4f020615a2a7d5f3268106013e78"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
