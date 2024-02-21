class Armv7UnknownLinuxMusleabihf < Formula
  desc "armv7 Linux MUSL eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/armv7-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "f88a2d4c8cc1a7e26f9373b0f9ef7eda918690156cdd5c8a9b123a6a0b55199e"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/armv7-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "ef2d1dadaf29fa2e00afe5fdd07a27e5fdd956a82173b0ce67998034e9a727b5"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
