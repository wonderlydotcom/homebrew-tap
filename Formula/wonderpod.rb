class Wonderpod < Formula
  desc "CLI for the WonderPod ephemeral dev-environment control plane"
  homepage "https://github.com/wonderlydotcom/internal-tool-wonderpod"
  version "0.89.0"

  depends_on "wonderlydotcom/tap/internal-tools"

  # v0 ships osx-arm64 + linux-x64 only; osx-x64 and linux-arm64 are deferred fast-follow.
  on_macos do
    on_arm do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.89.0/wonderpod-0.89.0-osx-arm64.tar.gz"
      sha256 "8da6f99bdaf19216681eb3a72b0e3f86c2bbb4cbf93d0f651d2a92cb76c68402"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/wonderpod-0.89.0/wonderpod-0.89.0-linux-x64.tar.gz"
      sha256 "137936225a962000b1fe5bdabec863411aa717da4e32aca8f4ea5052e97d9a00"
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
