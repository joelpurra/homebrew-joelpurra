require 'formula'

class Gitslave < Formula
  homepage 'https://github.com/joelpurra/gitslave'
  head 'https://github.com/joelpurra/gitslave.git'

  devel do
	  url 'https://github.com/joelpurra/gitslave/archive/v2.0.2-joelpurra-48-g733e659.tar.gz'
	  sha256 'bd948e8eccd0ea6e8a5da183b75174248ab777cafb8cf98f5ee5fc01a22f2d6c'
	  version 'v2.0.2-joelpurra-48-g733e659'
  end

  def install
    system "make", "install", "prefix=#{prefix}"
  end
end
