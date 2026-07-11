class InternalTools < Formula
  desc "Shared local auth helper for Wonderly internal IAP apps"
  homepage "https://github.com/wonderlydotcom/internal-tools-cli"
  url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/internal-tools-0.1.24/internal-tools-0.1.24.tar.gz"
  sha256 "fca4361d3df9a706b167171a63de035ea6df439dd1ec99068bd9a934b086deed"
  version "0.1.24"

  depends_on "python@3.12"

  def install
    libexec.install "internal-tools"
    (bin/"internal-tools").write_env_script libexec/"internal-tools", PATH => "#{Formula["python@3.12"].opt_bin}:$PATH"
  end

  test do
    assert_match "Shared local auth helper", shell_output("#{bin}/internal-tools --help")
  end
end
