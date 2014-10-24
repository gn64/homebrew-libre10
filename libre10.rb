require "formula"

# Documentation: https://github.com/Homebrew/homebrew/wiki/Formula-Cookbook
#                /usr/local/Library/Contributions/example-formula.rb
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
HOMEBREW_BREWALL_VERSION = '1.0.1'
class Libre10 < Formula
  homepage ""

  url 'https://bitbucket.org/gn64/libre10.git', :tag => "#{HOMEBREW_BREWALL_VERSION}"
  sha1 ""
  version HOMEBREW_BREWALL_VERSION
  head 'https://bitbucket.org/gn64/libre10.git', :branch => 'master'
  # depends_on "cmake" => :build
  depends_on "libtiff" 
  depends_on "libjpeg"
  depends_on "webp" 
  depends_on "little-cms2" 
  depends_on "graphicsmagick" 
  depends_on "poppler" 
  depends_on "libjpeg-turbo"

  resource "pycrypto" do
    url "https://pypi.python.org/packages/source/p/pycrypto/pycrypto-2.6.tar.gz"
    sha1 "c17e41a80b3fbf2ee4e8f2d8bb9e28c5d08bbb84"
  end

  resource "requests" do
    url "https://pypi.python.org/packages/source/r/requests/requests-2.4.3.tar.gz"
    sha1 ""
  end

  resource "pillow" do
    url "https://pypi.python.org/packages/source/P/Pillow/Pillow-2.6.1.tar.gz"
    sha1 ""
  end

  def install
    resource("pycrypto").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    resource("prequests").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    resource("pillow").stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
    
    # ENV.deparallelize  # if your formula fails when building in parallel

    # Remove unrecognized options if warned by configure
    #system "./configure", "--disable-debug",
    #                      "--disable-dependency-tracking",
    #                      "--disable-silent-rules",
    #                      "--prefix=#{prefix}"
    # system "cmake", ".", *std_cmake_args
    #system "make", "install" # if this fails, try separate make/make install steps
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
    system "false"
  end
end
