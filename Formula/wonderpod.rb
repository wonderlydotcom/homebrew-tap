class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.2.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.2.1/wonderpod-0.2.1-osx-arm64.tar.gz"
      sha256 "00e247b9ab9cedeea1577a7006afeaff3db2fc0bc7e1b0f94e3f58dfe5b41bf7"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.2.1/wonderpod-0.2.1-linux-x64.tar.gz"
      sha256 "4159a834d904c601dff957a1484a9212d45f9c83544d83088edfe2ab238ce23b"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
