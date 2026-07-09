class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.37.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.37.1/wonderpod-0.37.1-osx-arm64.tar.gz"
      sha256 "493e6f71a556530b5265c8ddc6636555bdb5e03305d11009164301f44747d527"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.37.1/wonderpod-0.37.1-linux-x64.tar.gz"
      sha256 "5cc7f7a9d240e343c0e32c1132a712c5e03ccbc89bc583ece22afd38eaf44181"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
