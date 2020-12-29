# typed: false
# frozen_string_literal: true

class Jq < Formula
  # Based on the original jq.rb formula.
  # https://github.com/Homebrew/homebrew-core/blob/master/Formula/jq.rb
  desc "Jqnpm's version of jq"
  homepage "https://github.com/joelpurra/jqnpm"
  # NOTE: opting to only offer the fork branch.
  url "https://github.com/joelpurra/jq.git",
      branch: "package-root"
  version "1.5-jqnpm-package-root"
  license "MIT"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "oniguruma"

  def install
    system "autoreconf", "-iv" unless build.stable?
    system "./configure",
           "--disable-dependency-tracking",
           "--disable-silent-rules",
           "--disable-maintainer-mode",
           "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    assert_equal "2\n", pipe_output("#{bin}/jq .bar", '{"foo":1, "bar":2}')
  end
end
