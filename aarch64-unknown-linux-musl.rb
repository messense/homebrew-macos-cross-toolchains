class Aarch64UnknownLinuxMusl < Formula
  desc "aarch64 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"
  revision 1

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/aarch64-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "e08ccc332bf75e4c5ef1f559835ec03b0d5df8bb28214b62f1cbd579385eff1f"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/aarch64-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "4fbe95500c327828b437f380bb15851e9a8126cf95180fbf15b76b78e0322ae3"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
