class LatteIntegrale < Formula
  desc ""
  homepage ""
  url "https://github.com/latte-int/latte/releases/download/version_1_7_5/latte-integrale-1.7.5.tar.gz"
  sha256 "75d8472bfff6e7df7c85e050421f1120894c637bb25f1740afaf6bbb6521a765"
  
  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    (testpath/"test").write <<~EOS
      3 3
      0 -1 0
      0 0 -1
      2 1 1
  EOS
    system "#{prefix}/bin/count", "--count-lattice-points", "test"
  end
end
