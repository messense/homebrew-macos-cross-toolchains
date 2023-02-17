class X8664UnknownLinuxMusl < Formula
  desc "x86_64 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/x86_64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "588bd5976efc441ae29a1574c27dfe4b0862ad28d868e53aad5c36cdd67450dc"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0/x86_64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "a3cd8f2d18effb6906a7a49dd3f0231440c090a90821916772d27daee8cda558"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
