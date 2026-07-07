class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.35.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.35.0/wonderpod-0.35.0-osx-arm64.tar.gz"
      sha256 "30effb9879892cb0428d767403e2092d4d5b4a7852cb50090a73521c619ea315"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.35.0/wonderpod-0.35.0-linux-x64.tar.gz"
      sha256 "d6e9dccf8013e900ed5801718a8619f68d5ebb042dfe4e3eb995bf79c3b55160"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
