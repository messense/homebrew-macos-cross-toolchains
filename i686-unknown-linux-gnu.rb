class I686UnknownLinuxGnu < Formula
  desc "i686 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/i686-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "d3461eb170395e200a22e270dbd9db68ba2d568e802206e4568de969d33118ae"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/i686-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "d34dd43870832dacbe02c660e6d4c3803e94c22e9abc99d118d109e45c036f23"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
