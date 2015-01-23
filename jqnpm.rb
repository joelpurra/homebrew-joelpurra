class Jqnpm < Formula
  homepage "https://github.com/joelpurra/jqnpm"
  head "https://github.com/joelpurra/jqnpm.git"
  url "https://github.com/joelpurra/jqnpm/archive/v0.5.5.tar.gz"
  sha256 "327b3b6605cab0f8340bcc1f1734fbdb78aa3c10bceaac810631d9691abd7ffe"

  class Foo < Formula
    depends_on "bash"
    depends_on "jq"
    depends_on "git"
    depends_on "shunit2"
  end

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
