class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.77.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.77.0/wonderpod-0.77.0-osx-arm64.tar.gz"
      sha256 "2c1804277a33fb5b209a28bd173272f01e03918e85324457fec88a963685e87a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.77.0/wonderpod-0.77.0-linux-x64.tar.gz"
      sha256 "749df8785cd34897f3d201642c8c4a90e517aeeb3fa47bc6ad4c695ca67c81e7"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
