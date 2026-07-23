class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.53.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.53.0/wonderpod-0.53.0-osx-arm64.tar.gz"
      sha256 "5a5fd0e923d9aa908aa2ad3d081620a24e5bdbe9b79ce3faa5ff211dbcf53c16"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.53.0/wonderpod-0.53.0-linux-x64.tar.gz"
      sha256 "819098cac479b3d7168a26966a7f2023fe3b03ab54dd2effa54eab2db29af0e9"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
