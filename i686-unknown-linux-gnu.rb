class I686UnknownLinuxGnu < Formula
  desc "i686-unknown-linux-gnu Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/i686-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "2be86c0ccb93f8167ff50f851375e62792c600c6d3e6d4bf1619a65094e534c6"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/i686-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "12c30a5c0a52f611ba8ccc747e75f2fbe8b8fceddf98cb593ba28a04ec7a139c"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
