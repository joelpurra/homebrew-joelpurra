class Npshell < Formula
  homepage "https://github.com/joelpurra/npshell"
  head "https://github.com/joelpurra/npshell.git"
  url "https://github.com/joelpurra/npshell/archive/v1.0.0.tar.gz"
  sha256 "6594a8b365562bbee83555bd953b703fbcfe3a571013dc0410ad95bba21c54ee"

  class Foo < Formula
    depends_on "bash"
    depends_on "fswatch"
  end

  def install
    prefix.install "src"
    bin.install_symlink prefix/"src/np"
  end

  test do
    system "#{bin}/np", "index"
    assert (testpath/".np.cache~").exist?,
            "npshell index file not created."
  end
end
