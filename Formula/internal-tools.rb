class InternalTools < Formula
  desc "Shared local auth helper for Wonderly internal IAP apps"
  homepage "https://github.com/wonderlydotcom/internal-tools-cli"
  url "https://github.com/wonderlydotcom/internal-tools-cli/releases/download/v0.1.0/internal-tools-0.1.0.tar.gz"
  sha256 "52bc9f770873d9fda6611733d4bfb8809ea6d3acfea6cf61b243576b85d4cb52"
  version "0.1.0"

  depends_on "python@3.12"

  def install
    libexec.install "internal-tools"
    (bin/"internal-tools").write_env_script libexec/"internal-tools", PATH => "#{Formula["python@3.12"].opt_bin}:$PATH"
  end

  test do
    assert_match "Shared local auth helper", shell_output("#{bin}/internal-tools --help")
  end
end
