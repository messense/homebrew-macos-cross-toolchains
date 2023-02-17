class I686UnknownLinuxMusl < Formula
  desc "i686 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/i686-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "2b147195106d7027a19c291647cef164955e5bac2fa1550d937c32aaad3586c6"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/i686-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "890c5aa938b6928f25582a08a15ddbd4f662c060ea879fe9b724e1514a72a2be"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
