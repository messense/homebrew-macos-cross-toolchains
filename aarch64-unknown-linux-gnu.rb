class Aarch64UnknownLinuxGnu < Formula
  desc "aarch64 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/aarch64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "a87669a9df908d8d8859849a0f9fc0fb287561a4e449c21dade10663d42d2ccb"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/aarch64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "6979291e34064583ac8b12a8b6b99ec6829caf22f47bcb68b646365ec9e24690"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
