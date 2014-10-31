require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
HOMEBREW_BREWALL_VERSION = '1.1.0'
class Libre10 < Formula
  homepage "http://www.rec10.org/?page_id=138"
  version "0.8"
  url 'https://bitbucket.org/gn64/libre10.git', :tag => "#{HOMEBREW_BREWALL_VERSION}"
  sha1 ""
  version HOMEBREW_BREWALL_VERSION
  head 'https://bitbucket.org/gn64/libre10.git', :branch => 'develop'
  depends_on "libtiff" 
  depends_on "libjpeg"
  depends_on "webp" 
  depends_on "little-cms2" 
  depends_on "graphicsmagick" 
  depends_on "poppler" 
  depends_on "libjpeg-turbo"
  depends_on :java => "1.7"
  depends_on 'pycrypto' => [:python,"Crypto"]
  depends_on 'requests' => :python
  depends_on 'pillow' => [:python,"PIL"]
  depends_on 'docopt' => :python

  def install
    system "python ./www/libre10_exec.py install --data-dir=#{HOMEBREW_PREFIX}/var --bin-dir=#{bin} --www-dir=#{prefix}/www"

  end

  test do
    system "true"
  end
end
