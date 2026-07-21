class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.49.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.49.0/wonderpod-0.49.0-osx-arm64.tar.gz"
      sha256 "dab915ecc60f1db62ea2a8cd685266bc3ec47c36c4f3329f5918874c0a795ff3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.49.0/wonderpod-0.49.0-linux-x64.tar.gz"
      sha256 "5a451167495afc92b266e594f892a3fdb8c1ff46810820acb6e3d86b60c49c79"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
