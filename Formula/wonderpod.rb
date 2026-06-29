class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.22.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.22.0/wonderpod-0.22.0-osx-arm64.tar.gz"
      sha256 "ffc3b9bc453078f4e675f50cc3af9891cdf317de9a03d2e7b263ffa8b4016d2f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.22.0/wonderpod-0.22.0-linux-x64.tar.gz"
      sha256 "e308e88f4047391672c47a381aea73f44ec436b4ec602b6b03d00e00330e35bb"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
