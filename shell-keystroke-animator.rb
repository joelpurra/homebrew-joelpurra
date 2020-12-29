# typed: false
# frozen_string_literal: true

class ShellKeystrokeAnimator < Formula
  desc "Simulate stroking keyboard keys while taking screenshots to create a .gif"
  homepage "https://github.com/joelpurra/shell-keystroke-animator"
  url "https://github.com/joelpurra/shell-keystroke-animator.git", tag: "v1.1.0"
  head "https://github.com/joelpurra/shell-keystroke-animator.git"

  depends_on "bash"
  depends_on "imagemagick"

  def install
    prefix.install "src"
    bin.install_symlink prefix/"src/keystroke-animator"
  end
end
