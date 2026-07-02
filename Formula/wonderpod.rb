class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.28.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.28.0/wonderpod-0.28.0-osx-arm64.tar.gz"
      sha256 "4cd2dbf7ef5b269995e6266face8d2e16097db54254ff12d4dc0df8ab877b19f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.28.0/wonderpod-0.28.0-linux-x64.tar.gz"
      sha256 "fad79fd4691ba4dfd17a5cca52753b9459240f92f33fa9f203cc8b712e567189"
    end
  end

  def install
    bin.install "wonderpod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
  end
end
