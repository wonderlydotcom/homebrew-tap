class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.65.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.65.0/wonderpod-0.65.0-osx-arm64.tar.gz"
      sha256 "04f5858ab16bb645c2fbb673706eac649a7cd4d8014631f97972030f01b7643f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.65.0/wonderpod-0.65.0-linux-x64.tar.gz"
      sha256 "e4d5d0a10cd5345e5d4085d944cbc3582364888d491d2313061d0e91e75d4ef7"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
