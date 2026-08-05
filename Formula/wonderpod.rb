class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.69.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.69.0/wonderpod-0.69.0-osx-arm64.tar.gz"
      sha256 "8bf9addf2a116ada264014b70b4a4827e8357ec7b8d4797ba995dff452ca4246"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.69.0/wonderpod-0.69.0-linux-x64.tar.gz"
      sha256 "6ec44d34d4324f4dca002f3a21ac9563475f0e49808f0566df86c571dccf7c2e"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
