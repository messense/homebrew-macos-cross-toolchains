class Armv7UnknownLinuxGnueabihf < Formula
  desc "armv7 Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.1.0/armv7-unknown-linux-gnueabihf-aarch64-darwin.zip"
    version "10.2.0"
    sha256 "8c45305716bb007ad0e1809e1b942856d24d764054b92b8e4fe49a6fd8238fac"
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
