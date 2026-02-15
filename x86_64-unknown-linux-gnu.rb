class X8664UnknownLinuxGnu < Formula
  desc "x86_64-unknown-linux-gnu Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/x86_64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "04746819d162f829dacf2ea6d6947b9fb4141ffbd91588f0bfbaab4c2c7e1a30"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/x86_64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "d82e9eb461939fe079b47c0a55c9c4130310507eeb55e60f076e65f3d4c6cb1e"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
