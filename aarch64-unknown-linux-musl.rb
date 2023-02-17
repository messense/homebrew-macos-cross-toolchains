class Aarch64UnknownLinuxMusl < Formula
  desc "aarch64 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/aarch64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "0b75eddd0c59f678a8db198b57b87891220ffe9d6224196fdbcf6eab0b4e8a22"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/aarch64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "49a01f7bbeab3619ca38a528a4f08fe9d092edc8dbaa810de62f3f56e5f1b463"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
