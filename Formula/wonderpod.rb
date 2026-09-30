class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://git.wonderly.info/wonderlydotcom/internal-tool-wonderpod"
  version "0.104.2"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.104.2/wonderpod-0.104.2-osx-arm64.tar.gz"
      sha256 "0e44a4876e3832c894ae14f381b882f1ed57d764d8f001ac571bdf2d9b3024ab"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.104.2/wonderpod-0.104.2-linux-x64.tar.gz"
      sha256 "6a4d987183c529d9b8a8f1918331be38d7729ee89e00a2b261bc7b10346b7611"
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
