class Aarch64UnknownLinuxGnu < Formula
  desc "aarch64 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"
  revision 1

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/aarch64-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "739373ad418623a268bdf35df13542dbde51a2b411044b2b6471339a00d59459"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/aarch64-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "ad7863d0129a7264d501b5e8bbf703b482e42900face4ad2e3e222f5d984fc13"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
