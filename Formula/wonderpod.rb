class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.3.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.3.0/wonderpod-0.3.0-osx-arm64.tar.gz"
      sha256 "367d85db76ab091eb096e71aa559e95c0d102a0c9b64f812047e3282625843d9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.3.0/wonderpod-0.3.0-linux-x64.tar.gz"
      sha256 "5d6595761b9fe31abfc362d3d2b8889d1ab368ec32529a9022f572fbf8b47de5"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
