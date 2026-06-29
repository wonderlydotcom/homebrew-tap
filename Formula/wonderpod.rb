class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.21.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.21.0/wonderpod-0.21.0-osx-arm64.tar.gz"
      sha256 "8b07148981682f35629d31e0ae21a8bfe848011bb6cae21053a0309210306757"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.21.0/wonderpod-0.21.0-linux-x64.tar.gz"
      sha256 "32a13d8afbd9836703bd3766da21d9f2583476ee60afb266dcccd6e7bc307c1c"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
