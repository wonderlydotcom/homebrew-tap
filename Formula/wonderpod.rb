class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.70.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.70.0/wonderpod-0.70.0-osx-arm64.tar.gz"
      sha256 "5ff2523ba3775e8bf1041015408ebcdff7140f3a43488913598dd2be5ded1de4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.70.0/wonderpod-0.70.0-linux-x64.tar.gz"
      sha256 "a463a325d0169cd37f1296395aa8e580295986fb40b031b08a9137260fe6faef"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
