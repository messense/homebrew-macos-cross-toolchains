class MipselUnknownLinuxGnu < Formula
  desc "mipsel Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"

  if Hardware::CPU.arm?
    depends_on "python@3.10"
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/mipsel-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "b4e521bb7c28ed2b66f94f6a1bb6e840066fcbe1e4efde01528921cda3a07e99"
  else
    depends_on "python@3.11"
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/mipsel-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "5585d3890d5b978f67e39812203667b1ddf1719ff3e0b6ce06d9bdce8e7a0903"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
