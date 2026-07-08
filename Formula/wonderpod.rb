class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.36.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.36.0/wonderpod-0.36.0-osx-arm64.tar.gz"
      sha256 "182b83bec8f58eabf1142b3453132f2f239a14d7f2d35db55e6cbf56ee8c49f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.36.0/wonderpod-0.36.0-linux-x64.tar.gz"
      sha256 "44f46ee33178cdc6889e943571204be7e6fa980161fba33c9417a8278c2478e6"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
