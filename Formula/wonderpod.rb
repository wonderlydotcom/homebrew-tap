class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.1.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.1.0/wonderpod-0.1.0-osx-arm64.tar.gz"
      sha256 "5d89c685e230654e0946d3fb348fcab79f582070088aeed203ca1b2e13449bd6"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.1.0/wonderpod-0.1.0-linux-x64.tar.gz"
      sha256 "dda3808621b63d385b2ace5410f6c8e0a27148cb79a71a308d7aea5cd076995e"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
