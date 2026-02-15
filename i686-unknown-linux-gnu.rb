class I686UnknownLinuxGnu < Formula
  desc "i686-unknown-linux-gnu Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/i686-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "3a601d81b9b1e79e76dada7893735deb75719f90dd6edbb08e0254a56123d168"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/i686-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "f21a5569568682636f664337774fdea96cdc88df6adb662b7f6e29428e9f69e8"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
