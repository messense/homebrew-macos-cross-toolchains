class Aarch64UnknownLinuxGnu < Formula
  desc "aarch64 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "10.3.0"

  depends_on "zstd"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/aarch64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "73368756074d04c4b318a7f4874bc1bafe945b0f997ef781b28c8e7a4398b7c1"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/aarch64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "89cd2c6db349fb1b2cd1ee7190d51f517e70a12b1f07fa0449d43f0fc25fb65c"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
