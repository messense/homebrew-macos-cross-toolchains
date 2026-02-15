class Armv7UnknownLinuxGnueabihf < Formula
  desc "armv7-unknown-linux-gnueabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/armv7-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "afaee575236de63ee492e2778afded2867f2cd014d0c41b27cb61828d2742df0"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/armv7-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "a8051c569c4fce90960a20ed057c6e7a1903df7614a81b797a1c05dbb146fab5"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
