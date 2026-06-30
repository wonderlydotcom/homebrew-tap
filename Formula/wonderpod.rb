class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.23.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.23.0/wonderpod-0.23.0-osx-arm64.tar.gz"
      sha256 "95e6d3cc49d4838fbbfbe853970cec5300bebbfdbc0a5fd666c35ab50c1075c5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.23.0/wonderpod-0.23.0-linux-x64.tar.gz"
      sha256 "697395211446d00949f3e83cbdd765bdbb5857b847bd3168d7965315c3a80033"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
