class Armv7UnknownLinuxGnueabihf < Formula
  desc "armv7 Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.1.0/armv7-unknown-linux-gnueabihf-aarch64-darwin.zip"
    version "10.2.0"
    sha256 "754cce3e8e455fe1d32bb8de69354b8118ee12b7dd0c8da7e033471010c154ea"
  else
    url ""
    version "10.2.0"
    sha256 ""
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
