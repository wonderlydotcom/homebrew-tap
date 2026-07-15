class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.44.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.44.0/wonderpod-0.44.0-osx-arm64.tar.gz"
      sha256 "6c5cd63a10f6a2c289b28276707ff4fc5395c628f3602f2164b3c824f9155283"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.44.0/wonderpod-0.44.0-linux-x64.tar.gz"
      sha256 "6317294d9833b7c5af07d0aedacbe6e7ca437db887527a9697cf494cc94d4a21"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
