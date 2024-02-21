class ArmUnknownLinuxMusleabihf < Formula
  desc "arm Linux MUSL eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/arm-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "5ab3b707f968e977e62332ec9cdb17689aa150688aafa65f36998ea5c1b5141c"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/arm-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "cdb9928329aa0e3eb4ac5958e4192a31b2bc0611a7ad076028bac4ed48974680"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
