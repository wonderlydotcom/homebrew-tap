class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.59.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.59.0/wonderpod-0.59.0-osx-arm64.tar.gz"
      sha256 "92481450362623fb412fddfa4ada25e5b0785096b62010aff890767351d41818"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.59.0/wonderpod-0.59.0-linux-x64.tar.gz"
      sha256 "5dc5f28cff78297bb7c45c3b8cc64a46360669b0770dafe1513a12f6d3b84c49"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
