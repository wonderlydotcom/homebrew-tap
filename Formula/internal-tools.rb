class InternalTools < Formula
  desc "Shared local auth helper for Wonderly internal IAP apps"
  homepage "https://github.com/wonderlydotcom/internal-tools-cli"
  url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/internal-tools-0.1.51/internal-tools-0.1.51.tar.gz"
  sha256 "84d99b30ddd249b5f44ed11316c81fe6bdd0b259ba457d0a26a56fc803e1f13e"
  version "0.1.51"

  depends_on "python@3.12"

  def install
    libexec.install "internal-tools"
    (bin/"internal-tools").write_env_script libexec/"internal-tools", PATH => "#{Formula["python@3.12"].opt_libexec}/bin:$PATH"
    bash_completion.install "completions/internal-tools.bash" => "internal-tools"
    zsh_completion.install "completions/_internal-tools"
    fish_completion.install "completions/internal-tools.fish"
  end

  test do
    assert_match "Shared local auth helper", shell_output("#{bin}/internal-tools --help")
    assert_match "_internal_tools_app_ids", shell_output("#{bin}/internal-tools completion bash")
  end
end
