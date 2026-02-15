class Aarch64UnknownLinuxMusl < Formula
  desc "aarch64-unknown-linux-musl Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/aarch64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "f7e081c0e0d0a0f7d4a769872b6471e91457ab982c7a9b201971ef4cb23e4694"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/aarch64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "7351afd573d38c9e034d5ab126233deb69aea6d187207624dbd3048ff1b087ea"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
