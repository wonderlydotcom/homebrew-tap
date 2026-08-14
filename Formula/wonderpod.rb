class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.80.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.80.0/wonderpod-0.80.0-osx-arm64.tar.gz"
      sha256 "8dc1a174571d69be98bc65e0e79b9486b1e2f641d0c2902e6abf8f92579d63cb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.80.0/wonderpod-0.80.0-linux-x64.tar.gz"
      sha256 "bc717a93a66f9623c1ba9f649eb672b438156cf2fb8195b0973a6c2ecd53d2d8"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
