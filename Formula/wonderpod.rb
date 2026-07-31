class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.63.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.63.0/wonderpod-0.63.0-osx-arm64.tar.gz"
      sha256 "cf568cd25acda74ff309d69358eaa899214b268505fa865cb3efab8f3cc8c48e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.63.0/wonderpod-0.63.0-linux-x64.tar.gz"
      sha256 "72ef092ef3721cee5586cee2a697e7e92709051e8604377cd3aa6567d4710d59"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
