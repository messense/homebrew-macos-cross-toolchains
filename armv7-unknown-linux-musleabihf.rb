class Armv7UnknownLinuxMusleabihf < Formula
  desc "armv7 Linux MUSL eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"
  revision 1

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/armv7-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "cf2b9f8509297704e313e4191e7543c4dc6aff8b9239a878b86f3e7723a69315"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/armv7-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "e5bccfcd5c2bd4abe2aa8d9a1f13fdda58cae6142b8570f04de3b87f26e77270"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
