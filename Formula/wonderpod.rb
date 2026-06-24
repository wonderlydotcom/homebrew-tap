class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.20.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.20.1/wonderpod-0.20.1-osx-arm64.tar.gz"
      sha256 "adbc0caa9e4597b0e7c5f08be7454e7bf16cd12ae8b9e8765880e139a034fa33"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.20.1/wonderpod-0.20.1-linux-x64.tar.gz"
      sha256 "2d731e5cc87637c354d3048390922ba5533cc3c65bcee4a5383de49558506432"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
