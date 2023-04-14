class I686UnknownLinuxMusl < Formula
  desc "i686 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"
  revision 1

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.10"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/i686-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "9c96e934afe4b476cb52f64192592dd32c33076cf1248524347ce76fbc30f7dc"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/i686-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "408ca52e049031de182ba1e030ec6c4f4b7d1c10db56ee4a21e87a86064a685a"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
