class InternalTools < Formula
  desc "Shared local auth helper for Wonderly internal IAP apps"
  homepage "https://github.com/wonderlydotcom/internal-tools-cli"
  url "https://github.com/wonderlydotcom/homebrew-tap/releases/download/internal-tools-0.1.28/internal-tools-0.1.28.tar.gz"
  sha256 "1588ef45f1eac23e94413ff6fbdc014bbcc530ff9b4b4004136d3b90d8198f49"
  version "0.1.28"

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
