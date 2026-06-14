class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.5.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.5.0/wonderpod-0.5.0-osx-arm64.tar.gz"
      sha256 "5f499ad607d09933a4fd2f290ad27d0b9a30fba411be3cdabab7356e8b294d25"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.5.0/wonderpod-0.5.0-linux-x64.tar.gz"
      sha256 "c4f622d92aacf7112933ac3e6522168932915fc3b0f09ba633f72b58cdab80f9"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
