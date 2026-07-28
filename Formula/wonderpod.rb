class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.55.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.55.0/wonderpod-0.55.0-osx-arm64.tar.gz"
      sha256 "09ea8189c00bf33b128668c4c9c3f80e36a85cbf784439770db27f7483ddb92d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.55.0/wonderpod-0.55.0-linux-x64.tar.gz"
      sha256 "07fa53eb5407c76951dc424605fe6ff9a3856282b0c42b9287b59999f18d8adb"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
