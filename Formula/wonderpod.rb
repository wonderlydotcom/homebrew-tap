class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.67.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.67.0/wonderpod-0.67.0-osx-arm64.tar.gz"
      sha256 "2144d55b62d13cd4abc34b91f8209424ae30adfbf2c3360176e56629f5e307f4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.67.0/wonderpod-0.67.0-linux-x64.tar.gz"
      sha256 "dabaeeb99d81bd14d365fa7657a6e19a63010cbf1e6d427b32b7f129cfb91b3d"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
