class Armv7UnknownLinuxGnueabihf < Formula
  desc "armv7 Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"
  revision 1

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/armv7-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "a78034087bb00d486df1de17d762b8d02e64ca65aed686ca93f3dbf1a97e4382"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/armv7-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "afe47fa2c6b076f494fa6b0c833524911e73dab867bd8ee0feac24748e685b22"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
