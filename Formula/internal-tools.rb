class InternalTools < Formula
  desc "Shared local auth helper for Wonderly internal IAP apps"
  homepage "https://github.com/wonderlydotcom/internal-tools-cli"
  url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/internal-tools-0.1.47/internal-tools-0.1.47.tar.gz"
  sha256 "a59a04ed0527b9a0fdf1bd6077ae14dc3d7747da72e4a6d948a469ecc5949d28"
  version "0.1.47"

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
