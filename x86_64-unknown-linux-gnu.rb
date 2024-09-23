class X8664UnknownLinuxGnu < Formula
  desc "x86_64-unknown-linux-gnu Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/x86_64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "e0be7e6f753841450245e26b6d68a07dc6a48a74abdb36d44b118e799ff4cb8d"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/x86_64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "4ee0ea09445c02c75290086abc669a76986cfd1949b94fd1310fff225472b48f"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
