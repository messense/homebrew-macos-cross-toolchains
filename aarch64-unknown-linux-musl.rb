class Aarch64UnknownLinuxMusl < Formula
  desc "aarch64 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/aarch64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "3f60dbda3b2934857cc63b27e1e680e36b181f3df9bbae9ec207989f47b0e7aa"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/aarch64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "15a7166de1b364e591d6b0206d127b67d15e88555f314170088f5e9ccf0ab068"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
