class MipselUnknownLinuxGnu < Formula
  desc "mipsel Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "11.2.0"
  revision 1

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"

  if Hardware::CPU.arm?
    depends_on "python@3.10"
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/mipsel-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "9878c769d5944e94f734f0ea72655a9c18e814898435766dea6426e0df02438e"
  else
    depends_on "python@3.11"
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v11.2.0-1/mipsel-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "f5729b9a07d94cc505dd8d025343af985f98ca851030ee9396ceba7be282cab6"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
