class InternalTools < Formula
  desc "Shared local auth helper for Wonderly internal IAP apps"
  homepage "https://github.com/wonderlydotcom/internal-tools-cli"
  url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/internal-tools-0.1.17/internal-tools-0.1.17.tar.gz"
  sha256 "6c6bd5390ee90e26a2c798e3353c72580b4d773ea9527b24b96c2f3b99c903c5"
  version "0.1.17"

  depends_on "python@3.12"

  def install
    libexec.install "internal-tools"
    (bin/"internal-tools").write_env_script libexec/"internal-tools", PATH => "#{Formula["python@3.12"].opt_bin}:$PATH"
  end

  test do
    assert_match "Shared local auth helper", shell_output("#{bin}/internal-tools --help")
  end
end
