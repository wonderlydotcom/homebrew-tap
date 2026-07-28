class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.56.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.56.0/wonderpod-0.56.0-osx-arm64.tar.gz"
      sha256 "eb779f9f281d67bcc09d9d802845650a9bb66fe942f22f1bf4bf86e928d461f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.56.0/wonderpod-0.56.0-linux-x64.tar.gz"
      sha256 "f3e25b3515a86cb1c926e34fdc9843a863e45fb5ff21155aa9a102000b484c7d"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
