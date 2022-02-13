class Aarch64UnknownLinuxMusl < Formula
  desc "aarch64 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "10.3.0"

  depends_on "zstd"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/aarch64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "0f25ca910fb05065c0807968cf3abb5c03b99cb43ada6e9c2c279534b1afc6a5"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/aarch64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "df6190f25c02e7241a8a6bd0dfd10f31ecec0eeb63e3b954d0f6af2eeed87be9"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
