class X8664UnknownLinuxGnu < Formula
  desc "x86_64 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/x86_64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "e6f593c9a19508a794a3ee1b1e1e5925d3782e6aec6856999b4a6f5bb59552fb"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/x86_64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "084fcced4c78f4624033b9c89c797364999768de431c390cdcc520a5a30d1b27"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
