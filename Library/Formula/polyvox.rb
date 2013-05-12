require 'formula'

class Polyvox < Formula
  homepage ''
  url 'http://volumesoffun.com/polyvox/releases/polyvox-0.2.1.tar.gz'
  sha1 '41200081c1963039cf0ccc35686f216db7b726ae'

  depends_on 'cmake' => :build
  depends_on 'doxygen' => :recommended
  depends_on 'qt' => :optional
  depends_on 'sphinx' => [:python, :recommended]

  def install
    mkdir 'build_homebrew' do
        system "cmake", "..", '-DCMAKE_CXX_FLAGS=-std=c++0x -stdlib=libc++', 
            '-DENABLE_BINDINGS=OFF', '-DENABLE_TESTS=OFF', '-DENABLE_EXAMPLES=OFF',
            '-DCMAKE_BUILD_TYPE=RelWithDebInfo', *std_cmake_args
        system "make", "install"
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test polyvox`.
    system "false"
  end
end
