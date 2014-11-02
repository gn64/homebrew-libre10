require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
HOMEBREW_BREWALL_VERSION = '1.1.0'
class Libre10 < Formula
  homepage "http://www.rec10.org/?page_id=138"
  version "0.9"
  url 'https://bitbucket.org/gn64/libre10.git', :tag => "#{HOMEBREW_BREWALL_VERSION}"
  sha1 ""
  version HOMEBREW_BREWALL_VERSION
  head 'https://bitbucket.org/gn64/libre10.git', :branch => 'release/1.1.0'
  depends_on "libtiff" 
  depends_on "libjpeg"
  depends_on "webp" 
  depends_on "little-cms2" 
  depends_on "graphicsmagick" 
  depends_on "poppler" 
  depends_on "libjpeg-turbo"
  depends_on :java => "1.7"
  depends_on :python
  #depends_on 'pycrypto' => [:python,"Crypto"]
  #depends_on 'requests' => :python
  #depends_on 'pillow' => [:python,"PIL"]
  #depends_on 'docopt' => :python

  resource "pycrypto" do
    url "https://pypi.python.org/packages/source/p/pycrypto/pycrypto-2.6.1.tar.gz"
    sha1 ""
  end
  
  resource "requests" do
    url "https://pypi.python.org/packages/source/r/requests/requests-2.4.3.tar.gz"
    sha1 ""
  end
  
  resource "pillow" do
    url "https://pypi.python.org/packages/source/P/Pillow/Pillow-2.6.1.tar.gz"
    sha1 ""
  end
  
  resource "docopt" do
    url "https://pypi.python.org/packages/source/d/docopt/docopt-0.6.2.tar.gz"
    sha1 ""
  end
  
  resource "cherrypy" do
    url "https://pypi.python.org/packages/source/C/CherryPy/CherryPy-3.6.0.tar.gz"
    sha ""
  end
    
  def install
    resource("pycrypto").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    resource("prequests").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    resource("pillow").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    resource("docopt").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    resource("cherrypy").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    inreplace "conf/org.rec10.libre10.solr.plist", "[username]", `whoami`.gsub("\n","")
    inreplace "conf/org.rec10.libre10.wsgi.plist", "[username]", `whoami`.gsub("\n","")
    system "cp conf/org.rec10.libre10.solr.plist ~/Library/LaunchAgents"
    system "cp conf/org.rec10.libre10.wsgi.plist ~/Library/LaunchAgents"
    system "python ./www/libre10_exec.py install --data-dir=#{HOMEBREW_PREFIX}/var --bin-dir=#{bin} --www-dir=#{prefix}/www"

  end

  test do
    system "true"
  end
end
