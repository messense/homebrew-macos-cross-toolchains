class ArmUnknownLinuxGnueabihf < Formula
  desc "arm Linux GNU eabihf Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.11"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/arm-unknown-linux-gnueabihf-aarch64-darwin.tar.gz"
    sha256 "84fe0ca9f2eb80103565065ea672568267b4405e0ececc69cedd31682f3cece1"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.2.0/arm-unknown-linux-gnueabihf-x86_64-darwin.tar.gz"
    sha256 "d724a44b03c3f51469c938170820c597ce8b625d3def17a29d1d50560c859f6c"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
