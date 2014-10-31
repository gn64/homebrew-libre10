require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
HOMEBREW_BREWALL_VERSION = '1.1.0'
class Libre10 < Formula
  homepage ""
  version "0.8"
  url 'https://bitbucket.org/gn64/libre10.git', :tag => "#{HOMEBREW_BREWALL_VERSION}"
  sha1 ""
  version HOMEBREW_BREWALL_VERSION
  head 'https://bitbucket.org/gn64/libre10.git', :branch => 'develop'
  # depends_on "cmake" => :build
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

  #resource "pycrypto" do
  #  url "https://pypi.python.org/packages/source/p/pycrypto/pycrypto-2.6.tar.gz"
  #  sha1 "c17e41a80b3fbf2ee4e8f2d8bb9e28c5d08bbb84"
  #end

  #resource "requests" do
  #  url "https://pypi.python.org/packages/source/r/requests/requests-2.4.3.tar.gz"
  #  sha1 ""
  #end

  #resource "pillow" do
  #  url "https://pypi.python.org/packages/source/P/Pillow/Pillow-2.6.1.tar.gz"
  #  sha1 ""
  #end

  #resource "docopt" do
  #  url "https://pypi.python.org/packages/source/d/docopt/docopt-0.6.2.tar.gz"
  #  sha1 ""
  #end

  def install
    #resource("pycrypto").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    #resource("prequests").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    #resource("pillow").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    #resource("docopt").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    system "python ./www/libre10_exec.py install --data-dir=#{HOMEBREW_PREFIX}/var --bin-dir=#{bin} --www-dir=#{prefix}/www --enable-jetty-bin --enable-wsgi-bin"

  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test libre10`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "true"
  end
end
