class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.22.4"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.22.4/wonderpod-0.22.4-osx-arm64.tar.gz"
      sha256 "8143962cbe192fb8d2272d812411c81fef4629f5e2d4e0cb0cb25eb92ee072b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.22.4/wonderpod-0.22.4-linux-x64.tar.gz"
      sha256 "08f9451af5628f390c21379672e6f8ca0fdc84bf03956ba1e6f77d7652b5491a"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
