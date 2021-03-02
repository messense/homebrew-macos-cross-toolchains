class Aarch64UnknownLinuxGnu < Formula
  desc "aarch64 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.1.0/aarch64-unknown-linux-gnu-aarch64-darwin.zip"
    version "10.2.0"
    sha256 "e35da4da4330912c5a188e321cf18ef8ef0abb18d0414a339f75b20c2bd7c0a1"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.1.0/aarch64-unknown-linux-gnu-x86_64-darwin.zip"
    version "10.2.0"
    sha256 "8c45305716bb007ad0e1809e1b942856d24d764054b92b8e4fe49a6fd8238fac"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
