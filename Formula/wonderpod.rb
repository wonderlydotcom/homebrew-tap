class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.82.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.82.0/wonderpod-0.82.0-osx-arm64.tar.gz"
      sha256 "23e3bd1c2bd81a5197827c398c653ff10bd9f9c7a1c33afe9e35b69cdd31b13c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.82.0/wonderpod-0.82.0-linux-x64.tar.gz"
      sha256 "0bc4df1f96d242079b129e0cbdee5d8b716e7a153ed3287a449ad673f8116447"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
