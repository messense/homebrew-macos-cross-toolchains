class Armv7UnknownLinuxMusleabihf < Formula
  desc "armv7-unknown-linux-musleabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/armv7-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "92d9829dcd2bfa3fe895ae6a3c74436e5caf272dfafe406e17a090fd163feb38"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/armv7-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "684a6a2b99f8462c73119b0b36309e4c384fbd303d06adbb9a2ddb53ea5cdbc0"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
