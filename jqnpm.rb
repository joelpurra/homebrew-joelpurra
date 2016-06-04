class Jqnpm < Formula
  desc "Package manager built for the command-line JSON processor jq."
  homepage "https://github.com/joelpurra/jqnpm"
  url "https://github.com/joelpurra/jqnpm.git", :tag => "v0.5.7"
  head "https://github.com/joelpurra/jqnpm.git"

  depends_on "bash"
  depends_on "jq"
  depends_on "shunit2"

  def install
    prefix.install "src"
    bin.install_symlink prefix/"src/jqnpm"
  end

  test do
    assert_match /install/, shell_output("#{bin}/jqnpm help")
  end
end
