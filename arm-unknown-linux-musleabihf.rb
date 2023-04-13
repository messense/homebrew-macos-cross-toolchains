class ArmUnknownLinuxMusleabihf < Formula
  desc "arm Linux MUSL eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/arm-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "0089dae44e7cde8b3b7e133ea6401887134144a0e159b8b6a2a8be4816910cbf"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/arm-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "68c6a53b4dbf6cba229efebe1d2768e087089291ac8cfb74b8cebca8ddd6bdfa"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
