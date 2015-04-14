class Npshell < Formula
  homepage "https://github.com/joelpurra/npshell"
  head "https://github.com/joelpurra/npshell.git"
  url "https://github.com/joelpurra/npshell.git", :tag => "v1.1.5"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "fswatch"
  option "with-terminal-notifier", "Enables OS X notification support."
  depends_on "terminal-notifier" => :optional

  if build.with? "terminal-notifier"
    def caveats; <<-EOS.undent
      Notifications are not autostarted by brew; to do so
      add the following line to your ~/.bash_profile:
          np notify --is-running || ( np notify & )

      To avoid getting error messages running `np daemon` without `launchd`,
      add the following line to your ~/.bash_profile:
          np daemon --is-running || ( np daemon & )
      EOS
    end
  else
    def caveats; <<-EOS.undent
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

  test do
    system "#{bin}/np", "index"
    assert (testpath/".np.cache~").exist?,
            "npshell index file not created."
  end

  plist_options :startup => false, :manual => "np daemon"

  def plist; <<-EOS.undent
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
end
