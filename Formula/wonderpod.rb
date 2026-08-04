class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.66.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.66.0/wonderpod-0.66.0-osx-arm64.tar.gz"
      sha256 "276dde41a295421ef610c207e7a28dfe456da7419b6408f855e144216cc77802"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.66.0/wonderpod-0.66.0-linux-x64.tar.gz"
      sha256 "42b9ec833e56dde904698ee84bc72b469f386c53a4f415257d940d47b27b23da"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
