class ArmUnknownLinuxGnueabi < Formula
  desc "arm Linux GNU eabi Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"
  revision 1

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/arm-unknown-linux-gnueabi-aarch64-darwin.tar.gz"
    sha256 "db6024f117307b6f34bfdfb00487f67662e5e2dbe41ad6d2f2bfb132c64dd6be"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/arm-unknown-linux-gnueabi-x86_64-darwin.tar.gz"
    sha256 "25a4d2352fb518a7e8ab39d0ea22e99005311914f0839d28fc8ea4cc42281f4b"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
