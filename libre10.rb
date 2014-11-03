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
  head 'https://bitbucket.org/gn64/libre10.git', :branch => 'master'
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
    sha1 "aeda3ed41caf1766409d4efc689b9ca30ad6aeb2"
  end
  
  resource "requests" do
    url "https://pypi.python.org/packages/source/r/requests/requests-2.4.3.tar.gz"
    sha1 "411f1bfa44556f7dd0f34cd822047c31baa7d741"
  end
  
  resource "pillow" do
    url "https://pypi.python.org/packages/source/P/Pillow/Pillow-2.6.1.tar.gz"
    sha1 "d789cad38db37b14d7650817111f000da7776c73"
  end
  
  resource "docopt" do
    url "https://pypi.python.org/packages/source/d/docopt/docopt-0.6.2.tar.gz"
    sha1 "224a3ec08b56445a1bd1583aad06b00692671e04"
  end
  
  resource "cherrypy" do
    url "https://pypi.python.org/packages/source/C/CherryPy/CherryPy-3.6.0.tar.gz"
    sha1 "bbbeb4e2bb81cb37049a32f78c6cb151b12d7857"
  end
    
  def install
    ENV["PYTHONPATH"] = lib+"python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", libexec+"lib/python2.7/site-packages"
    ENV.prepend_create_path "PYTHONPATH", prefix+"lib/python2.7/site-packages"
    resource("pillow").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    resource("docopt").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    #resource("cherrypy").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    resource("pycrypto").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    resource("requests").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    inreplace "conf/org.rec10.libre10.solr.plist", "[username]", `whoami`.gsub("\n","")
    inreplace "conf/org.rec10.libre10.wsgi.plist", "[username]", `whoami`.gsub("\n","")
    #system "cp conf/org.rec10.libre10.solr.plist ~/Library/LaunchAgents"
    #system "cp conf/org.rec10.libre10.wsgi.plist ~/Library/LaunchAgents"
    system "python ./www/libre10_exec.py install --data-dir=#{HOMEBREW_PREFIX}/var --bin-dir=#{bin} --www-dir=#{prefix}/www"
    bin.env_script_all_files(libexec+"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end

  test do
    system "true"
  end
end
