class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.42.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.42.0/wonderpod-0.42.0-osx-arm64.tar.gz"
      sha256 "32b4cb919e8f1a74b092806277fb6037c1d7f2bec9c7b1a37c4dfa74391341d4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.42.0/wonderpod-0.42.0-linux-x64.tar.gz"
      sha256 "d0ed8bdc4f319a1d36620f4c887b01926ce69acf78c520753682f320cd7057f9"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
