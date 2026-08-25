class InternalTools < Formula
  desc "Shared local auth helper for Wonderly internal IAP apps"
  homepage "https://github.com/wonderlydotcom/internal-tools-cli"
  url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/internal-tools-0.1.45/internal-tools-0.1.45.tar.gz"
  sha256 "2a9685e0327299a2a6368be86a4e09a11c5e56a2b9684a96bdf0492c764b7b2a"
  version "0.1.45"

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
