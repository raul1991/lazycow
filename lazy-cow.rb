class LazyCow < Formula
  desc "Install custom dev setups with one command"
  homepage ""
  url "https://transfer.sh/bJ3k8c/lazy-cow-0.0.12-bin.tar.gz"
  mirror ""
  sha256 ""
  license ""
  version "0.0.12"
  depends_on "cowsay"
  depends_on "lolcat"
  depends_on "boxes"

  def install
    # Fix the permissions on the global settings file.
    libexec.install Dir["*"]
    # Leave conf file in libexec. The mvn symlink will be resolved and the conf
    # file will be found relative to it
    Pathname.glob("#{libexec}/bin/*") do |file|
      next if file.directory?
      basename = file.basename
      bin.write_exec_script file, (libexec/"bin/")
    end
    puts `cowsay "All done. Going back to my farm now."`
  end
  
  def test
    assert_equal "Hello World!", shell_output("#{bin}/lazycow test").strip
  end
end
