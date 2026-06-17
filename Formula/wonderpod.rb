class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.13.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.13.1/wonderpod-0.13.1-osx-arm64.tar.gz"
      sha256 "e614022563c73c3c0481b863ae00e64f43bee81ce56d882b4535906895f7d3b9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.13.1/wonderpod-0.13.1-linux-x64.tar.gz"
      sha256 "46926d68ffb1b457ec8b0bdddef9e925baf83e1fe944b1a21e60963b20114710"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
