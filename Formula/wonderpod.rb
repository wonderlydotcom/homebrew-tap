class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.20.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.20.0/wonderpod-0.20.0-osx-arm64.tar.gz"
      sha256 "9d874804a160689c03e379030753170e142f3061371a210e0a0f8b6cbe0b9c5b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.20.0/wonderpod-0.20.0-linux-x64.tar.gz"
      sha256 "f3ce6c06dfac2c5c3e3da901231006c9094d5895f8b6f1be2a646dc4c834fdf6"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
