class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.32.2"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.32.2/wonderpod-0.32.2-osx-arm64.tar.gz"
      sha256 "e1dffb4f1a18daab997b67cabf0f06e10d3064e3243c39762d1e3f5ff90e2947"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.32.2/wonderpod-0.32.2-linux-x64.tar.gz"
      sha256 "2783cbf05e9306083929cc1a04ccd364ecf2f51590590fd19e9e8712af6fb2d9"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
