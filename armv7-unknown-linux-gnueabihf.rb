class Armv7UnknownLinuxGnueabihf < Formula
  desc "armv7-unknown-linux-gnueabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/armv7-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "b31019869d76f35c0e190a581c9a8bf0c7a117d1e8aa204e018ada9abd239a36"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/armv7-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "29486e75b6a1f6ac652332bfcfdc02ae8647dffcc57c2f6b64ee5fdef209327b"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
