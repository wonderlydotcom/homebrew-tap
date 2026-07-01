class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.24.5"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.5/wonderpod-0.24.5-osx-arm64.tar.gz"
      sha256 "7b70b7e13f35b3e7c44385520867e95c5caa25d9dc111d3f332bdfe5e2e91b7c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.24.5/wonderpod-0.24.5-linux-x64.tar.gz"
      sha256 "39320b0fa741456cc544eacb6827b09440d5aeeb66bb1d2ba8f8168baced8475"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
