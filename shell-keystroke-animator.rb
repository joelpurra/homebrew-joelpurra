class ShellKeystrokeAnimator < Formula
  homepage "https://github.com/joelpurra/shell-keystroke-animator"
  head "https://github.com/joelpurra/shell-keystroke-animator.git"
  url "https://github.com/joelpurra/shell-keystroke-animator/archive/v1.1.0.tar.gz"
  sha256 "6efec10f007009e6f4b6dd8eb0ff0a2df763dd37d33085c0586dd66f3cb5b888"

  depends_on "bash"
  depends_on "imagemagick"

  def install
    prefix.install "src"
    bin.install_symlink prefix/"src/keystroke-animator"
  end

  test do
    # These tests run Mac OS X automation tools to take screenshots, and
    # aren't expected to actually work on a build server.
    system "echo 'true' |  "
    require "open3"
    Open3.popen3("#{bin}/keystroke-animator", "0", "0.01", "0.01", "0.01") do |stdin, stdout, _|
      stdin.write("true")
      stdin.close
    end
    assert (testpath/"output.gif").exist?,
            "output.gif was not created."
  end
end
