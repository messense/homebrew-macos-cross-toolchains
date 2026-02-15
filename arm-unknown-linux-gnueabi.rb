class ArmUnknownLinuxGnueabi < Formula
  desc "arm-unknown-linux-gnueabi Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/arm-unknown-linux-gnueabi-aarch64-darwin.tar.gz"
    sha256 "6ac01462674ad33c391eacb87e7a02b4557673139c9b47907d297d450e799f58"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/arm-unknown-linux-gnueabi-x86_64-darwin.tar.gz"
    sha256 "0b74b3dc472c857e0622ab4d038abda590a892015dd7b4fad75d9912281ed2b1"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
