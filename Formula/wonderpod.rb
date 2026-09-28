class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://git.wonderly.info/wonderlydotcom/internal-tool-wonderpod"
  version "0.104.1"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.104.1/wonderpod-0.104.1-osx-arm64.tar.gz"
      sha256 "15920150c5448935c42a5cf70c6d4ffcf8d024cc75f03edd79b45263c0c97fc9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.104.1/wonderpod-0.104.1-linux-x64.tar.gz"
      sha256 "e6a348cc7d0190f2a8f68561fbb8601d96e166bbf52b7beddaf184d11741f1e9"
    end
  end

  def install
    bin.install "wonderpod"
    # Runs `wonderpod completion <shell>` and installs each script where the shell looks for it, so
    # Tab completes Pod names out of the box. Both scripts are static text the binary prints with no
    # network or auth involved.
    generate_completions_from_executable(bin/"wonderpod", "completion", shells: [:bash, :zsh])
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wonderpod version")
    assert_match "complete -F _wonderpod wonderpod", shell_output("#{bin}/wonderpod completion bash")
  end
end
