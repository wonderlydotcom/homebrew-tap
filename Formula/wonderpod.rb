class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.16.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.16.0/wonderpod-0.16.0-osx-arm64.tar.gz"
      sha256 "1fd86652e60de4891e7d88752e75e44d608f53497bd4ba4d0694786ff5d61ebf"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.16.0/wonderpod-0.16.0-linux-x64.tar.gz"
      sha256 "d892e022827ec2bf81730b44a8989ad22cb4d69b4c13ecb933ba033de99764ab"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
