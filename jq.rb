class Jq < Formula
  # This file has been based on the original `jq.rb` formula. Make sure to keep it updated.
  # https://github.com/Homebrew/homebrew-core/blob/master/Formula/jq.rb
  desc "jqnpm's version of jq"
  homepage "https://github.com/joelpurra/jqnpm"

  devel do
    url "https://github.com/joelpurra/jq.git", :branch => "package-root"
    version "1.5-jqnpm-package-root"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  depends_on "oniguruma" # jq depends > 1.5

  def install
    system "autoreconf", "-iv" unless build.stable?
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--disable-maintainer-mode",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_equal "2\n", pipe_output("#{bin}/jq .bar", '{"foo":1, "bar":2}')
  end
end
