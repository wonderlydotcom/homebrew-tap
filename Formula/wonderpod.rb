class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.37.3"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.37.3/wonderpod-0.37.3-osx-arm64.tar.gz"
      sha256 "13137de01d0a947f9eaacfc524a04f333fd13bffdb695a6c7bf70870440b773e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.37.3/wonderpod-0.37.3-linux-x64.tar.gz"
      sha256 "59acb26f826404f8fc252053eb513512e81d0739c4eeeb1c3243437ae9d45cbf"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
