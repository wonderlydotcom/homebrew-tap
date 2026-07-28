class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.57.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.57.0/wonderpod-0.57.0-osx-arm64.tar.gz"
      sha256 "c17c11c44c1aaf2d67fb65f8699b2912b449c3a2a3785803a9b05ef93097311e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.57.0/wonderpod-0.57.0-linux-x64.tar.gz"
      sha256 "0b7ea0d378af7fa1864adc397b04b5fae0ace8f8ed0f12737105d18965f21064"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
