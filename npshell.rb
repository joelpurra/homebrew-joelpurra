# typed: false
# frozen_string_literal: true

class Npshell < Formula
  desc "Command-line music queue manager"
  homepage "https://github.com/joelpurra/npshell"
  url "https://github.com/joelpurra/npshell.git", tag: "v1.4.1"
  license "GPL-3.0-or-later"
  head "https://github.com/joelpurra/npshell.git"

  option "without-terminal-notifier", "Disables OS X notification dependencies."

  depends_on "bash"
  depends_on "coreutils"
  depends_on "fswatch"
  depends_on "terminal-notifier" => :recommended

  if build.with? "terminal-notifier"
    depends_on "id3v2"

    def caveats
      <<-EOS
      Notifications are not autostarted by brew; to do so
      add the following line to your ~/.bash_profile:
          np notify --is-running || ( np notify & )

      To avoid getting error messages running `np daemon` without `launchd`,
      add the following line to your ~/.bash_profile:
          np daemon --is-running || ( np daemon & )
      EOS
    end
  else
    def caveats
      <<-EOS
      The daemon can also run when you start your terminal.
      Add the following line to your ~/.bash_profile:
          np daemon --is-running || ( np daemon & )
      EOS
    end
  end

  def install
    prefix.install "src"
    bin.install_symlink prefix/"src/np"
  end

  plist_options startup: false, manual: "np daemon"
  def plist
    <<-EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-/Apple/DTD PLIST 1.0/EN" "http:/www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>KeepAlive</key>
        <false/>
        <key>RunAtLoad</key>
        <true/>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/np</string>
          <string>daemon</string>
        </array>
        <key>StandardErrorPath</key>
        <string>#{var}/log/npshell.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/npshell.log</string>
      </dict>
    </plist>
    EOS
  end

  test do
    system "#{bin}/np", "index"
    assert_predicate (testpath/".np.cache~"), :exist?,
                     "npshell index file not created."
  end
end
