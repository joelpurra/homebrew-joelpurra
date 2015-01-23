class Jqnpm < Formula
  homepage "https://github.com/joelpurra/jqnpm"
  head "https://github.com/joelpurra/jqnpm.git"
  url "https://github.com/joelpurra/jqnpm.git", :tag => "v0.5.5"

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

    # The required jq version has not been released at the time of writing.
    system "jq", "--null-input", "--join-output", "-L", ".", '"x"'
  end
end
