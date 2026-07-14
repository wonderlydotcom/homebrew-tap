class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.40.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.40.0/wonderpod-0.40.0-osx-arm64.tar.gz"
      sha256 "c290e7eb099f77037d4939475af908e38f25aea88c2eb84e61d76dd445729a8f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.40.0/wonderpod-0.40.0-linux-x64.tar.gz"
      sha256 "6d1f80d996b993ebaae816afacc276392a43d01891764442c1cfda26ad6743e6"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
