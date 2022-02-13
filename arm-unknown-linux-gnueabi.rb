class ArmUnknownLinuxGnueabi < Formula
  desc "arm Linux GNU eabi Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "10.3.0"

  depends_on "zstd"
  depends_on "python@3.9"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/arm-unknown-linux-gnueabi-aarch64-darwin.tar.gz"
    sha256 ""
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/arm-unknown-linux-gnueabi-x86_64-darwin.tar.gz"
    sha256 "f9b2c1726e61bf1cb33376f5996a8bbb8a254ffd0dcb98c500b5994dc143c2a3"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
