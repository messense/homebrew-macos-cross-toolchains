class ArmUnknownLinuxGnueabihf < Formula
  desc "arm Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"
  revision 1

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/arm-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "f0d32f96cebe8fbfc18345d8bf9e6f8aa82af494e7707e5aabddf71a762a2c26"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/arm-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "bfd8d7bfefc6b2356b69dd22e651f6c4ea006dcc3e7fb4b087f060cc6d29b068"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
