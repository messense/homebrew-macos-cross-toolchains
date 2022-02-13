class X8664UnknownLinuxMusl < Formula
  desc "x86_64 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "10.3.0"

  depends_on "zstd"
  depends_on "python@3.9"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/x86_64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "c30ec6948cbb7a2e6b8202e8987e78514c6bd7b5ca520d22ee54e07c8dc5962e"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/x86_64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "1a6bed20ab1f4800e2af119c1694c3378fd2df514fb11a40374efef49838e86e"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
