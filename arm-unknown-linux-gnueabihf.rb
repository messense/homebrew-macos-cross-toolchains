class ArmUnknownLinuxGnueabihf < Formula
  desc "arm Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/arm-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "c3ec08bc724032014ab5a7d221433adbe4d20cfd50ec895a319f7fd7be54029c"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/arm-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "b47ff0c6ab8ed9e98dd4971715a4591abf9bd5dff525d7baa6f4a80a8374a3a9"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
