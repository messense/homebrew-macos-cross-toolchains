class I686UnknownLinuxGnu < Formula
  desc "i686 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "10.3.0"

  depends_on "zstd"
  depends_on "python@3.9"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/i686-unknown-linux-gnu-aarch64-darwin.tar.gz"
    sha256 "98d9206ae063953b691725138320ac792e0e782b0471b389c8bc0085f8c6093f"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/i686-unknown-linux-gnu-x86_64-darwin.tar.gz"
    sha256 "69d69e2e776694dde1ca4220722cb1cb3697e6fb4dfe45b94b67bd650e5f0d82"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
