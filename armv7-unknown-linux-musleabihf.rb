class Armv7UnknownLinuxMusleabihf < Formula
  desc "armv7-unknown-linux-musleabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/armv7-unknown-linux-musleabihf-aarch64-darwin.tar.gz"
    sha256 "295802a7c36c3cdd71fb08f921c70e02fbd10a6ab8c464dde56dbbf323e1827d"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/armv7-unknown-linux-musleabihf-x86_64-darwin.tar.gz"
    sha256 "c25cd90b2a65b8e91448de121ae7ceedf983aeafb90ac1c2a2b0ec0845727381"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
