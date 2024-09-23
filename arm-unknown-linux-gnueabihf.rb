class ArmUnknownLinuxGnueabihf < Formula
  desc "arm-unknown-linux-gnueabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/arm-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "a233bd74dec09ccb00b9c3dea19f3fe0a7b7df5c43bb850ae2b5f1ab30466d46"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/arm-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "38648dbd071322bbd44cd1eca0524d2a40af10e52512f18d1ff414b37988e468"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
