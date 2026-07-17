class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.45.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.45.0/wonderpod-0.45.0-osx-arm64.tar.gz"
      sha256 "eb16576c2234ec909ed2ce7c1ff073c5189d3fca0ec6d5204924debe87fd94b1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.45.0/wonderpod-0.45.0-linux-x64.tar.gz"
      sha256 "cae4156499a3cb83fc6384e9f790adbb3aba6cab16f76059b2100a7f23805e4b"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
