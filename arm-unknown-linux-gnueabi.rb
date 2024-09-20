class ArmUnknownLinuxGnueabi < Formula
  desc "arm Linux GNU eabi Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/arm-unknown-linux-gnueabi-aarch64-darwin.tar.gz"
    sha256 "ee6265fab91e120afe4bb48fc86984c8edb500fd02f456275f9a445a9051e1fa"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/arm-unknown-linux-gnueabi-x86_64-darwin.tar.gz"
    sha256 "88a49bcdb1addcc9ffee6f844dc44bca412b8156c47f6f5cd0ab2d27a19f50dd"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
