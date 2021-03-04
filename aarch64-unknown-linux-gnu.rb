class Aarch64UnknownLinuxGnu < Formula
  desc "aarch64 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.2.0/aarch64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    version "10.2.0"
    sha256 "139f23e1cab798499eeb185a6de03a77ad3db93017e30e4b492c70b01d397573"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.2.0/aarch64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    version "10.2.0"
    sha256 "b852f310e3a4750826e3c0e2cf146e63a94ccb15dcf4fc81c8ac58b2a4b8f6d6"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
