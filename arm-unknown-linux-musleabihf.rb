class ArmUnknownLinuxMusleabihf < Formula
  desc "arm-unknown-linux-musleabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/arm-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "e305fa5a2fc46375b6d86a41f6983ddb8718de7ab2dadd901039c233822d2da6"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/arm-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "3587b02d7726bf53769ee0c90849cae8498a4fceca8d84d2fd983f3ee0173afe"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
