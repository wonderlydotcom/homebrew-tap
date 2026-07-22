class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.52.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.52.0/wonderpod-0.52.0-osx-arm64.tar.gz"
      sha256 "26329a0a653406c79fe2288cf342933e288d485c4b546330c6e2fc939c8d9e5b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.52.0/wonderpod-0.52.0-linux-x64.tar.gz"
      sha256 "c2618b426b1ab2f00d7ad355593cfd886d329560de2cd4ea4d2807915d72c4e9"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
