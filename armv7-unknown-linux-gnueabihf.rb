class Armv7UnknownLinuxGnueabihf < Formula
  desc "armv7 Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/armv7-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "3d6f308e408fc769e2c8c5a90eda74ad8c6f4f4c1c786d4419480a37bc8e2ed1"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/armv7-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "e1b4a0dafce3df7287b813a84d373e3edd7f122054f39accfbcdfaa4a31f9598"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
