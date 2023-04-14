class ArmUnknownLinuxMusleabihf < Formula
  desc "arm Linux MUSL eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"
  revision 1

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/arm-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "cfc7da747c72b5fcc4622a7fbeb7e05a87c3f866c266fd6ce2916a88c293b3e6"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/arm-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "b2cf3d2a4b4866c631d4276328d5e59d3a33748515e4ed4033c4bd5cf839c775"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
