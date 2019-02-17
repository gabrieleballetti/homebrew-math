class Topcom < Formula
  desc "TOPCOM is a package for computing Triangulations Of Point Configurations and Oriented Matroids"
  homepage "http://www.rambau.wm.uni-bayreuth.de/TOPCOM/"
  url "http://www.rambau.wm.uni-bayreuth.de/Software/TOPCOM-0.17.8.tar.gz"
  sha256 "3f83b98f51ee859ec321bacabf7b172c25884f14848ab6c628326b987bd8aaab"
  depends_on "gmp" => :recommended

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"square.txt").write("[[0,0,1],[0,1,1],[1,0,1],[1,1,1]]")
    system bin/"points2finetriangs" "<" "square.txt"
  end
end
