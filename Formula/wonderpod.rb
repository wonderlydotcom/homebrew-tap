class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.37.4"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.37.4/wonderpod-0.37.4-osx-arm64.tar.gz"
      sha256 "e1b518300fe25853270009af65ae323b3a8c4543a5e2b216cc8ee0b9d2b84965"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.37.4/wonderpod-0.37.4-linux-x64.tar.gz"
      sha256 "ea71a6ff4a75d3684334f49c814bf7a9993e60bebd6d96219e598f003b4597d8"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
