class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.73.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.73.0/wonderpod-0.73.0-osx-arm64.tar.gz"
      sha256 "7e81e9e90b4c05dbcb321656eee8cc014ba00e7861a238aaf0c704e406fd81db"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.73.0/wonderpod-0.73.0-linux-x64.tar.gz"
      sha256 "8f000ff14ef82622d030bfaea773692e4fd07f1def668028119a4e43f729b1d4"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
