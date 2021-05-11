class X8664UnknownLinuxGnu < Formula
  desc "x86_64 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/x86_64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    version "10.3.0"
    sha256 "b625e611d2b40b27c77dde4aa406b38f1dbd2c7df9661b89707cb7c9a57a961c"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/x86_64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "813b6fd20326b745264d1a7c11d5a286c7aeb8150036c01261ca1dcfd58dba8b"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
