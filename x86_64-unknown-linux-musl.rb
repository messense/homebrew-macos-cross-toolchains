class X8664UnknownLinuxMusl < Formula
  desc "x86_64-unknown-linux-musl Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/x86_64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "9cb2ac32617fbc5812d411005d791cb10956be4f43efc1b14fa09030ce985f69"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/x86_64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "c6b3a250c73cc3f1a2cceba64fbca98ba554068a86941d0b464febb023b2dd12"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
