class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.17.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.17.0/wonderpod-0.17.0-osx-arm64.tar.gz"
      sha256 "ee0aec8426ccdc85b60f169584f54fceef23f5f6a502ea290e9b0637cfac5603"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.17.0/wonderpod-0.17.0-linux-x64.tar.gz"
      sha256 "48a70ce0a808c8b12ec29b2e3efa89b43c338d185d99c75db21c89bf347865d8"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
