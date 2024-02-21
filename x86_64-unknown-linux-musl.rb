class X8664UnknownLinuxMusl < Formula
  desc "x86_64 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/x86_64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "de0a12a677f3b91449e9c52a62f3d06c4c1a287aa26ba0bc36f86aaa57c24b55"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/x86_64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "ff0f635766f765050dc918764c856247614c38e9c4ad27c30f85c0af4b21e919"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
