class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.25.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.25.0/wonderpod-0.25.0-osx-arm64.tar.gz"
      sha256 "52518111548836093bee6f8258b1645662585e8557378454cdfc0df4f1a8da75"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.25.0/wonderpod-0.25.0-linux-x64.tar.gz"
      sha256 "db17462a72128d01d88a56956ecc5cd36d2303bd5bc57a8fa59dbb69302fcb5b"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
