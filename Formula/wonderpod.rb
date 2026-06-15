class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.9.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.9.0/wonderpod-0.9.0-osx-arm64.tar.gz"
      sha256 "a674311c37803256d8b8e156fe1234b5b62523581f54425f71aa67dee9193315"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.9.0/wonderpod-0.9.0-linux-x64.tar.gz"
      sha256 "64d153e784b527ed28af7b54e948c1d5d73d7aedb112b1a065c9f3400cab351e"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
