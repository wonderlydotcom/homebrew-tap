class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.50.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.50.0/wonderpod-0.50.0-osx-arm64.tar.gz"
      sha256 "393c935187d737df28374011204202ce9bf57b7fe7b35e32de53a358691bd32e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.50.0/wonderpod-0.50.0-linux-x64.tar.gz"
      sha256 "25b77cd383e377c4a9ca8a1f3ebcf7869b72ca0bd12e4487f2081e33e00421c4"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
