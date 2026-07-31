class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.64.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.64.0/wonderpod-0.64.0-osx-arm64.tar.gz"
      sha256 "4b24740fd16d4ba481d3bf58f8e4cce2432dfcbff949d4540340ee10350fc26f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.64.0/wonderpod-0.64.0-linux-x64.tar.gz"
      sha256 "f5fc3151203ce5f0c90a85c54b56d9b839d1f365fe6da9c1083927433fca93fb"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
