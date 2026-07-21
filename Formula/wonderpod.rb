class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.47.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.47.0/wonderpod-0.47.0-osx-arm64.tar.gz"
      sha256 "9b49d333a579f8a8ed04b8de475b9c954dacc992779744bcfacb8da3c707a887"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.47.0/wonderpod-0.47.0-linux-x64.tar.gz"
      sha256 "3481ce25d6bf755cb07e37aec0355eeb61f30f56d7eb4bb3a679d8fe57e3342c"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
