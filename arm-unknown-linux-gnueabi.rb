class ArmUnknownLinuxGnueabi < Formula
  desc "arm Linux GNU eabi Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/arm-unknown-linux-gnueabi-aarch64-darwin.tar.gz"
    sha256 "6bf1217cbb7c18129c13dfdf89c1a2828b9849430f35616fd28635ea02d31b80"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/arm-unknown-linux-gnueabi-x86_64-darwin.tar.gz"
    sha256 "10eedb6821d7e0daeb125b5cf253321c9c7861d962507bc2040bdfe9444af837"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
