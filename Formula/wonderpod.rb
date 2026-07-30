class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.62.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.62.0/wonderpod-0.62.0-osx-arm64.tar.gz"
      sha256 "5cc52336263a6d2d3689d6c32c7b18bff5c58039538cddcaa22a4e57245620f2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.62.0/wonderpod-0.62.0-linux-x64.tar.gz"
      sha256 "7174c62ca85d5ca39ae3fbe9b2376a6bf371f838b157bcc6ed7e3960888ea184"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
