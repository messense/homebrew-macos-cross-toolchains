class Armv7UnknownLinuxGnueabihf < Formula
  desc "armv7 Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/armv7-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "df812230cee595b3ce7654ab97941d6f6870709b15db24680e9bbc0818710110"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/armv7-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "b13464f556aedca29dcc7ec4f99d575c644bf1356692bb107e506d16a19beb22"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
