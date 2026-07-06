class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.31.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.31.1/wonderpod-0.31.1-osx-arm64.tar.gz"
      sha256 "6ed5f3bda15fc865149609013b9cb3b3167500a35770a92c76185e1983c20233"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.31.1/wonderpod-0.31.1-linux-x64.tar.gz"
      sha256 "12940259c2b40ba4c95085e32f5b1f42cd68bbd833906fb34ef18468e2ae5d7d"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
