class InternalTools < Formula
  desc "Shared local auth helper for Wonderly internal IAP apps"
  homepage "https://github.com/wonderlydotcom/internal-tools-cli"
  url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/internal-tools-0.1.26/internal-tools-0.1.26.tar.gz"
  sha256 "8465453ee648a307b52c80be58a3fddb4c1f2eb4a76a725d87617b67753936d4"
  version "0.1.26"

  depends_on "python@3.12"

  def install
    libexec.install "internal-tools"
    (share/"internal-tools/skills").install Dir["skills/*"]
    (bin/"internal-tools").write_env_script libexec/"internal-tools", PATH => "#{Formula["python@3.12"].opt_bin}:$PATH"
  end

  test do
    assert_match "Shared local auth helper", shell_output("#{bin}/internal-tools --help")
  end
end
