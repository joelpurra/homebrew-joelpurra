class Jqnpm < Formula
  homepage "https://github.com/joelpurra/jqnpm"
  head "https://github.com/joelpurra/jqnpm.git"
  url "https://github.com/joelpurra/jqnpm.git", :tag => "v0.5.6"

  depends_on "bash"
  depends_on "jq"
  depends_on "git"
  depends_on "shunit2"

  def install
    prefix.install "src"
    bin.install_symlink prefix/"src/jqnpm"
  end

  test do
    assert_match /install/, shell_output("#{bin}/jqnpm help")
  end
end
