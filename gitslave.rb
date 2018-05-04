require 'formula'

class Gitslave < Formula
  desc "Unofficial fork of gitslave, hopefully more active than the original."
  homepage 'https://github.com/joelpurra/gitslave'
  head 'https://github.com/joelpurra/gitslave.git'

  devel do
    version '2.0.2-joelpurra-51-g203467d'
    url 'https://github.com/joelpurra/gitslave/archive/v2.0.2-joelpurra-51-g203467d.tar.gz'
    sha256 '21ba3d4d8d9a70b4d5c09f89db3881dbc05b3db9de2b7a512f233a6aff80a464'
  end

  def install
    system "make", "install", "prefix=#{prefix}"
  end
end
