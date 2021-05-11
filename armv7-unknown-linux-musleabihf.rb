class Armv7UnknownLinuxMusleabihf < Formula
  desc "armv7 Linux MUSL eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "10.3.0"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/armv7-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "8c48e904bf46204abc3820b171c6cfa9760ab8f4a20ce42093180fe47ce8debf"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/armv7-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "a1d6091bb8753cc495e357857dcc14568f57fdecf0bf59e9bbc2c407dcc3c001"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
