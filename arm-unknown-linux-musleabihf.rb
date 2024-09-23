class ArmUnknownLinuxMusleabihf < Formula
  desc "arm-unknown-linux-musleabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/arm-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "ebb0c62c71ba216602f5e59b1404451a2427eaa48276a1b4845be49fdfe3a6fb"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/arm-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "f8a7ca39b96260f030d0a823a5d71c1ddc9139381c5cdbb0bb85d1ab665e0878"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
