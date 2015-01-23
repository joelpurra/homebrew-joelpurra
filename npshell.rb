class Npshell < Formula
  homepage "https://github.com/joelpurra/npshell"
  head "https://github.com/joelpurra/npshell.git"
  url "https://github.com/joelpurra/npshell/archive/v1.0.0.tar.gz"
  sha256 "6594a8b365562bbee83555bd953b703fbcfe3a571013dc0410ad95bba21c54ee"

  depends_on "bash"
  depends_on "coreutils"
  depends_on "fswatch"

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
