class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.18.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.18.0/wonderpod-0.18.0-osx-arm64.tar.gz"
      sha256 "609a8b03fc0065ccd81860b4c4a9e8a4dde91c81bd1c809c62d99cceebf511c4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.18.0/wonderpod-0.18.0-linux-x64.tar.gz"
      sha256 "5175d2675bbac1736d9943b569168f26a2f137a0ed678fe01e1248db71068e9e"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
