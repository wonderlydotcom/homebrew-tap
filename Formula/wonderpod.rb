class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.78.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.78.0/wonderpod-0.78.0-osx-arm64.tar.gz"
      sha256 "b7222aee95a85632e7274218a7aeae30724432a332ad01a80458e69624db4310"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.78.0/wonderpod-0.78.0-linux-x64.tar.gz"
      sha256 "18b26ea141d34a5d6497fe5aee3a298ca55bf6cfee3e25aec651b2859b115c44"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
