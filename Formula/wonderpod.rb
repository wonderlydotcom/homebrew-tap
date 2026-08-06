class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.72.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.72.0/wonderpod-0.72.0-osx-arm64.tar.gz"
      sha256 "769f1ba5b31f060c5a0cc87c3846e85029d366136259e7e3a2830a9016539247"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.72.0/wonderpod-0.72.0-linux-x64.tar.gz"
      sha256 "f8e1295ef11eeccde775fa56ff5fb44481471a376fc4dedf7e201712c1a2460f"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
