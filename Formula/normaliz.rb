class Normaliz < Formula
  desc "Normaliz is an open source tool for computations in affine monoids, vector configurations, lattice polytopes, and rational cones."
  homepage "https://www.normaliz.uni-osnabrueck.de/"
  url "https://github.com/Normaliz/Normaliz/releases/download/v3.6.3/normaliz-3.6.3.tar.gz"
  sha256 "701b39189758eb9a13e189ea1a43218e1c001f19c228e761a80949d610fe3900"

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"NN3p.in").write("amb_space 4\npolytope 4\n0 0 0\n2 0 0\n0 3 0\n0 0 5")
    system "normaliz", "NN3p.in"
  end
end
