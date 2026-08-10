class InternalTools < Formula
  desc "Shared local auth helper for Wonderly internal IAP apps"
  homepage "https://github.com/wonderlydotcom/internal-tools-cli"
  url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/internal-tools-0.1.33/internal-tools-0.1.33.tar.gz"
  sha256 "50b1ba7d0c5ceee8d4b48789f31c4df73424fd8c76b44dc6fa6de59f3b7ee10e"
  version "0.1.33"

  depends_on "python@3.12"

  def install
    libexec.install "internal-tools"
    (bin/"internal-tools").write_env_script libexec/"internal-tools", PATH => "#{Formula["python@3.12"].opt_libexec}/bin:$PATH"
  end

  test do
    assert_match "Shared local auth helper", shell_output("#{bin}/internal-tools --help")
  end
end
