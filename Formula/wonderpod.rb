class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.24.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.0/wonderpod-0.24.0-osx-arm64.tar.gz"
      sha256 "32982a032a184b3f54158082a11b9db4983688f5679e028b237a47c8baab7afa"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.0/wonderpod-0.24.0-linux-x64.tar.gz"
      sha256 "ee7b324774aa3d74ae6face27f7040fe438c126be0e454816b70230a9c87471a"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
