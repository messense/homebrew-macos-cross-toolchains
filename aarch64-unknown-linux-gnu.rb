class Aarch64UnknownLinuxGnu < Formula
  desc "aarch64-unknown-linux-gnu Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/aarch64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "5092abd7f9f318672e833a8ad99a88d3d9044afc6e7152b26740d18b29949141"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/aarch64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "b138ca4384313687a87eb9c25203aa57ddd36f440b8de1830af2fdd2019e1581"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
