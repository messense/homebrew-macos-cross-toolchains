class X8664UnknownLinuxMusl < Formula
  desc "x86_64-unknown-linux-musl Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/x86_64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "0e29d81d6646447dd526f117c425d5c34c007fc0d2b7742680958fbdef93822c"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/x86_64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "72696a0d37b95f7f4a116aebf2396f98b2f1376f155cfc3c122dfec8b0150cbd"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
