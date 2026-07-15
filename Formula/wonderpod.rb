class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.43.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.43.0/wonderpod-0.43.0-osx-arm64.tar.gz"
      sha256 "548bf0c94f9b936e11439d4b40bc475cec2b49af75b01a05a8505022af2fd128"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.43.0/wonderpod-0.43.0-linux-x64.tar.gz"
      sha256 "93e673b333cf208c0745042c429e45751373193f79d568060a01a016dbbcea79"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
