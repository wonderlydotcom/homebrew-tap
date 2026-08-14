class InternalTools < Formula
  desc "Shared local auth helper for Wonderly internal IAP apps"
  homepage "https://github.com/wonderlydotcom/internal-tools-cli"
  url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/internal-tools-0.1.36/internal-tools-0.1.36.tar.gz"
  sha256 "1adcf2a321ff98a0178df955823eb1b543364934ca186bc78f493a652e0718a7"
  version "0.1.36"

  depends_on "python@3.12"

  def install
    libexec.install "internal-tools"
    (bin/"internal-tools").write_env_script libexec/"internal-tools", PATH => "#{Formula["python@3.12"].opt_libexec}/bin:$PATH"
  end

  test do
    assert_match "Shared local auth helper", shell_output("#{bin}/internal-tools --help")
  end
end
