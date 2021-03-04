class X8664UnknownLinuxGnu < Formula
  desc "x86_64 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.2.0/x86_64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    version "10.2.0"
    sha256 "aa336065b8bdbfa700e756e676b966f380379da2cda6503a5166e3fe505b45dd"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.2.0/x86_64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    version "10.2.0"
    sha256 "591061e8753b28907d0dc9f5e9c52b933b6b6993077673bca53d74f7ac969be2"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
