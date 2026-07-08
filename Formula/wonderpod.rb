class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.36.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.36.1/wonderpod-0.36.1-osx-arm64.tar.gz"
      sha256 "8f22462627d89d9c2f397cda95afe2182f01023077a5326b18edbd47f20d2c4a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.36.1/wonderpod-0.36.1-linux-x64.tar.gz"
      sha256 "4b0a125be0ee3f3795a240ffd19be868b6e250d1336da99b4446c586c96f45a5"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
