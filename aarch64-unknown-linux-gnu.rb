class Aarch64UnknownLinuxGnu < Formula
  desc "aarch64-unknown-linux-gnu Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/aarch64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "0f224db36d8572489f09ed5bce39f189eee998f9ab4f8ea07f510d6c7078caa3"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/aarch64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "7fa485313b7049d57c5de56bf876d5c4648ebfd736f86a8f4739596218523127"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
