class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.44.2"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.44.2/wonderpod-0.44.2-osx-arm64.tar.gz"
      sha256 "f656d59bdd34658727d84542a61cdb1495a43b60f5678793bd2f9d9066fed7df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.44.2/wonderpod-0.44.2-linux-x64.tar.gz"
      sha256 "82659ac20549f1c8a5766797724d5de842cced1f73703b445ea6d96f7b25a0b1"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
