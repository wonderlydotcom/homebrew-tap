class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.33.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.33.0/wonderpod-0.33.0-osx-arm64.tar.gz"
      sha256 "e42db0b79fc6130e7f769eaba1e115aefc30d7fa6f03d74da3c9dde2edd03dac"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.33.0/wonderpod-0.33.0-linux-x64.tar.gz"
      sha256 "e7b11a27d35864483c4d0c21d3b115283522cf14b7e64ab12de9c201a7abbff1"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
