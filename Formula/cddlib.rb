class Cddlib < Formula
  desc "A C implementation of the Double Description Method of Motzkin et al."
  homepage "https://www.inf.ethz.ch/personal/fukudak/cdd_home/"
  url "https://github.com/cddlib/cddlib/releases/download/0.94j/cddlib-0.94j.tar.gz"
  sha256 "27d7fcac2710755a01ef5381010140fc57c95f959c3c5705c58539d8c4d17bfb"
  
  depends_on "gmp"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"main.c").write("int main () {}")
    system "gcc", "-I/usr/local/include", "-L/usr/local/lib", "main.c", "-lcdd"
  end
end
