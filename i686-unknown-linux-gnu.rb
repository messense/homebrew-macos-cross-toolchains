class I686UnknownLinuxGnu < Formula
  desc "i686 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"
  revision 1

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/i686-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "72147bec7d2d30acc10eb93670305cfcaa24c3bea8ad57342f3d34fa21da524d"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/i686-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "c9bdf78510f7148a8a0a9d1850f426994de425bc443685b494867686e4951c0a"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
