class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.22.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.22.1/wonderpod-0.22.1-osx-arm64.tar.gz"
      sha256 "43384240d86b42b72b90559da2f5fcf0a6acc77a820e02546b76bd18d549a065"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.22.1/wonderpod-0.22.1-linux-x64.tar.gz"
      sha256 "5c82dbb32ddfa44e7f01b8e1709de65c28b439630e90e91731b0badecda301c0"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
