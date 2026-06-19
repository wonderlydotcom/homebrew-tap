class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.15.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.15.0/wonderpod-0.15.0-osx-arm64.tar.gz"
      sha256 "0253f833dff27e04aee907b656ebe6d2b463c0b4b162a26f299d01e45e23da6e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.15.0/wonderpod-0.15.0-linux-x64.tar.gz"
      sha256 "462a499086db11848c42771147da6ba4861341ca4ff1b3285de4ca5db00b3d72"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
