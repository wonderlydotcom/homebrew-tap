class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.24.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.1/wonderpod-0.24.1-osx-arm64.tar.gz"
      sha256 "81f8b1e6a1f3f1972898613507203fb64c58e54a1b9d2f425010bb743e628048"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.1/wonderpod-0.24.1-linux-x64.tar.gz"
      sha256 "1bb895be013501e7d2a35134f3f737d2e05b1a39df6cfba7dae0e15eac834878"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
