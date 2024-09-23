class Aarch64UnknownLinuxMusl < Formula
  desc "aarch64-unknown-linux-musl Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/aarch64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "7eee015d2536ccc2e8b263554d3477e16d1e9d78284bddcfe303db170b1bbea6"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/aarch64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "2deb4f7315cd2bc44f2b5da6ee0f8f4212ef23656ded84fdc269edf7f737b9e5"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
