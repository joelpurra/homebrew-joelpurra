# typed: false
# frozen_string_literal: true

class Jqnpm < Formula
  desc "Package manager built for the command-line JSON processor jq"
  homepage "https://github.com/joelpurra/jqnpm"
  url "https://github.com/joelpurra/jqnpm.git", tag: "v0.5.7"
  license any_of: ["MIT", "BSD-2-Clause", "GPL-3.0-or-later"]

  head do
    url "https://github.com/joelpurra/jqnpm.git",
        branch: "jq-package-root"
    version "v0.5.7-jq-package-root"

    depends_on "joelpurra/joelpurra/jq" => :head
  end

  depends_on "bash"
  depends_on "jq" unless build.head?
  depends_on "shunit2"

  def install
    prefix.install "src"
    bin.install_symlink prefix/"src/jqnpm"
  end

  test do
    assert_match(/install/, shell_output("#{bin}/jqnpm help"))
  end
end
