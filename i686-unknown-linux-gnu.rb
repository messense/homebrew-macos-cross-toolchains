class I686UnknownLinuxGnu < Formula
  desc "i686 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/i686-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "96f9285b10d81c8c2f5bbb3364b5fe1472082e6c74fdd18522d5d3b09a8c0128"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/i686-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "ef232d85d05286bea61863ae47c48d5aa2c5adf8711d6c6fb85373150cbb335d"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
