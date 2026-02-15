class MipselUnknownLinuxGnu < Formula
  desc "mipsel-unknown-linux-gnu Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "15.2.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.14"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/mipsel-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "e3134121655af3995be0c59751b52cfd7a153c6874f745d2bdeca01b4a15d33e"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v15.2.0/mipsel-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "1bb23136e142f9900a4532a8ec59bb46a0b9240f687fe4dac0e5b29097181b1f"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
