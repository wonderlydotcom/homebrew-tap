class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.13.2"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.13.2/wonderpod-0.13.2-osx-arm64.tar.gz"
      sha256 "39f8d11b2a06ea694193cc99001af2e748b2fd551e461a845ed4840e441b6c2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.13.2/wonderpod-0.13.2-linux-x64.tar.gz"
      sha256 "de22c73f2776b754052eef00d944ca60f4ba83abd4d86960d9565c65fc5de765"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
