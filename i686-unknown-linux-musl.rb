class I686UnknownLinuxMusl < Formula
  desc "i686-unknown-linux-musl Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/i686-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "7ad035fb1a5edd0df6b221855a7bfedf9c426e3eb531f93d88ef8d9c70931cba"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/i686-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "c62f7ae9e1c27c76755f8c4e178f32f94c7a877d5f15b180f909895d5c30e823"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
