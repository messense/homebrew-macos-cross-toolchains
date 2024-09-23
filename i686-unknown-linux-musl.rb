class I686UnknownLinuxMusl < Formula
  desc "i686-unknown-linux-musl Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "13.3.0"

  depends_on "bdw-gc"
  depends_on "guile"
  depends_on "zstd"
  depends_on "python@3.12"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/i686-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "af39edc473382a0a1fa583ee28d21c2bf20c3aea55129e3a5bad3f614ba85019"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v13.3.0/i686-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "0969c1b83bfc177774edf616f74b953e2239693c19d2b419485b29ff90608f58"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
