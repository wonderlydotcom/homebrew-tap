class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.4.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.4.0/wonderpod-0.4.0-osx-arm64.tar.gz"
      sha256 "e75f2f0d6b397cd7ae5323dd58f04a40b2f6243d8b8b9c59c1988e42430cd4d0"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.4.0/wonderpod-0.4.0-linux-x64.tar.gz"
      sha256 "1e22ab32f6314721f3a6406b541e332338b5e2833522c552c7d7fec4d0803371"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
