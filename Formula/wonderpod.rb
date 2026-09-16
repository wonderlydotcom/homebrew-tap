class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.102.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.102.0/wonderpod-0.102.0-osx-arm64.tar.gz"
      sha256 "a8791f50e6ddb87594e0cae9d858038a960db96215f212e5e528ffdc1a015ad4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.102.0/wonderpod-0.102.0-linux-x64.tar.gz"
      sha256 "9b4205436f0ae635a4aa7b6d1077eec4df14a3bf156346228bce3c6ea1466574"
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
