class Armv7UnknownLinuxGnueabihf < Formula
  desc "armv7 Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "10.3.0"

  depends_on "zstd"
  depends_on "python@3.9"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/armv7-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "bb3983953dfc484b668ca14bf2f1129e77fd9886f095ed4be3497eaa33d22b2a"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/armv7-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "3df57f8fc6b21b1199cb2b9ef7175d3908be8998f385b16a9523b8f17d33d8ab"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
