class ArmUnknownLinuxGnueabi < Formula
  desc "arm-unknown-linux-gnueabi Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/arm-unknown-linux-gnueabi-aarch64-darwin.tar.gz"
    sha256 "7167c4c5adffad5fc6681e4a810868251aba005bc8989f3e7a6d1ee0d4c9099b"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/arm-unknown-linux-gnueabi-x86_64-darwin.tar.gz"
    sha256 "bf7cd8ecdafb5a451aab20ab4871fedcfdd275a5aa7c398f26f975de73f1b235"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
