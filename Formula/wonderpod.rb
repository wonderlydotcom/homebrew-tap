class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.29.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.29.0/wonderpod-0.29.0-osx-arm64.tar.gz"
      sha256 "9e51fb4c7a687eb7a8b52553d557b5e846129ccbd0cac07a11ebaff5da441550"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.29.0/wonderpod-0.29.0-linux-x64.tar.gz"
      sha256 "be568815b1cd8c9ce5c96e07cebf52a0fa052d6abf757c8937e859ab836488be"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
