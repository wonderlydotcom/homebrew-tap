class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.81.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.81.0/wonderpod-0.81.0-osx-arm64.tar.gz"
      sha256 "4ca68a2e2fa3c720f0196b326ac668928e0fd9555d107c664bca616f7ac904f8"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.81.0/wonderpod-0.81.0-linux-x64.tar.gz"
      sha256 "30c27216e9b6b3e8955be0f92a7ca8e188ee71574b7cf5dfbad46755faa0ea76"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
