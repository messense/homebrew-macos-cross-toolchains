class X8664UnknownLinuxGnu < Formula
  desc "x86_64 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/x86_64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "bb59598afd84b4d850c32031a4fa64c928fb41f8ece4401553b6c23714efbc47"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/x86_64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "86e28c979e5ca6d0d1019c9b991283f2ab430f65cee4dc1e4bdf85170ff7c4f2"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
