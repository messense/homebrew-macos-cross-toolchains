class Armv7UnknownLinuxGnueabihf < Formula
  desc "armv7 Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.2.0/armv7-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    version "10.2.0"
    sha256 "0697494215ad1f72f5e05aff8d81a0e4c6d73d3c9c31bf33a6eda1ad5f52115d"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.2.0/armv7-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    version "10.2.0"
    sha256 "a495c7e31b211461e718b8577d6ceb4f0df638af3b0407cd1b276257c346fa5e"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
