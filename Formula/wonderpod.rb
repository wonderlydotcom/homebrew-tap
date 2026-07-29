class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.60.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.60.0/wonderpod-0.60.0-osx-arm64.tar.gz"
      sha256 "b63de530602c6d2519e88d4999c6069799f9eed980caa4eef66b7158d86e6100"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.60.0/wonderpod-0.60.0-linux-x64.tar.gz"
      sha256 "0c42ae2e8aec9f46cd7aad942e078bf031a969a64810badb5e03753131cd4226"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
