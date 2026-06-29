class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.21.2"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.21.2/wonderpod-0.21.2-osx-arm64.tar.gz"
      sha256 "d3a593097f7f9bbb165958997790e4d61b9bc2792bb2f0965f4c6465d3b8267e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.21.2/wonderpod-0.21.2-linux-x64.tar.gz"
      sha256 "ae28ffa1e770bc610989af6431c95794133f13f5c68f45b67664f76d6fad0757"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
