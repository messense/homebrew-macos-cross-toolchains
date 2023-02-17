class Aarch64UnknownLinuxGnu < Formula
  desc "aarch64 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/aarch64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "c08d0a5d08185932af17472196b86fd2eaa73d20a5e3c68a8950828647590d94"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/aarch64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "fcb9b40c2489b7648154631664a1001eb6b4358af9f1841980f610fd20f5f712"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
