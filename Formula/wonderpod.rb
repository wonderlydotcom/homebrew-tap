class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.7.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.7.0/wonderpod-0.7.0-osx-arm64.tar.gz"
      sha256 "209b3c060e3c336c56ac4c2cec040622211c7e21e5d6a54fadca61f1c5cbcb1b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.7.0/wonderpod-0.7.0-linux-x64.tar.gz"
      sha256 "71e28fb8d0ef6ac3845efed3a85d68cc54eca6ca6946b5e22af6971c530b8527"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
