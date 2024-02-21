class I686UnknownLinuxMusl < Formula
  desc "i686 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/i686-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "774c58d86877cb8a9f21705418137f2564b0c7bdc60db3d9461781c12803917d"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/i686-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "0c56ec34be51295a3da5b9c890ebe77a209ca707ff163ec377ba3b3f11bd5703"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
