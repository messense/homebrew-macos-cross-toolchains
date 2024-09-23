class MipselUnknownLinuxGnu < Formula
  desc "mipsel-unknown-linux-gnu Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/mipsel-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "b1a85172d6db74c210908ac1b8e636533c9ebaa4cf3a21e59b2b11c3a6ca11b8"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/mipsel-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "958e3b87d4937f975e38a2b9bd5a508fbf180b141a418fbcce96affbe3f9845c"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
