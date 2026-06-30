class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.23.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.23.1/wonderpod-0.23.1-osx-arm64.tar.gz"
      sha256 "e8d14afb028d10bd99080cb296cb18b982a02875e9933e4c0ab74987d1eff2c7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.23.1/wonderpod-0.23.1-linux-x64.tar.gz"
      sha256 "337830dc8eed0afc7b7c2fe13c23498d984aee70997684c5e2fe541b06680c7b"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
