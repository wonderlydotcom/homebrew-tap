class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.22.2"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.22.2/wonderpod-0.22.2-osx-arm64.tar.gz"
      sha256 "6e8c7e347ac35f62e7e9142eee3723461358f0d6b26b5d77cf56fe3ec7f989f1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.22.2/wonderpod-0.22.2-linux-x64.tar.gz"
      sha256 "a520a263696acbba7c4f142728993a854002c99f503ca37d1424670ffbad255f"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
