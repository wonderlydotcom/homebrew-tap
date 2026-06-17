class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.14.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.14.0/wonderpod-0.14.0-osx-arm64.tar.gz"
      sha256 "db2024aacc29c9d54bca44b2297de3895c97e2c27b2f4a809069474250d69161"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.14.0/wonderpod-0.14.0-linux-x64.tar.gz"
      sha256 "2e1cbb49eaaabec50f750be4d80b18aaf60b5478d9631e712af1f3ed910d508c"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
