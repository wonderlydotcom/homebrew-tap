class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.76.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.76.0/wonderpod-0.76.0-osx-arm64.tar.gz"
      sha256 "b56a694aa35380aa5c87657c04d160b156a41c30981e14f0f69ec6dfde81ffae"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.76.0/wonderpod-0.76.0-linux-x64.tar.gz"
      sha256 "c167cc3e7a76680a4b4f327a6fe3eddbac877ed90671d6c5bcc69a4d4245d48d"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
