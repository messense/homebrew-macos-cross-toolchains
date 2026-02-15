class ArmUnknownLinuxGnueabihf < Formula
  desc "arm-unknown-linux-gnueabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/arm-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "ae0d00dc462845e211a65cd5a68fd6399bc4a904e1137558167dadfaf2033040"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/arm-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "a6a22ae1c794f25c2bf29e08ba45e44ba4102066715d577355b3b52dd3e9443f"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
