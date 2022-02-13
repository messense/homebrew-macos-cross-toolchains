class ArmUnknownLinuxGnueabihf < Formula
  desc "arm Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "10.3.0"

  depends_on "zstd"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/arm-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 ""
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/arm-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "d5153917d06ad5a26ce798e967909c8ee8106fcd9c791890401e5e48f7e9848f"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
