class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.24.4"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.4/wonderpod-0.24.4-osx-arm64.tar.gz"
      sha256 "138a4d530edb9b927550f8dc694709cc9c1210fcb74f316772174f34544a98a1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.4/wonderpod-0.24.4-linux-x64.tar.gz"
      sha256 "f4f11def8b444afd3cc503048ea7bec44a04f14a794e21c6f5a36e8e3fb61bd7"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
