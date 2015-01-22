class Jqnpm < Formula
  homepage "https://github.com/joelpurra/jqnpm"
  head "https://github.com/joelpurra/jqnpm.git"
  url "https://github.com/joelpurra/jqnpm/archive/v0.5.4.tar.gz"
  sha256 "4e88984f09dedac2e41ee3d7b2a5fb325549a54a07fd863f970f53bff28578cb"

  class Foo < Formula
    depends_on "bash"
    depends_on "jq"
    depends_on "git"
  end

  def install
    prefix.install Dir["src"]
    bin.install_symlink prefix/"src/jqnpm"
  end

  test do
    assert_match /install/, shell_output("#{bin}/jqnpm help")

    # The required jq version has not been released at the time of writing.
    system "jq", "--null-input", "--join-output", "-L", '.', '"x"'
  end
end
