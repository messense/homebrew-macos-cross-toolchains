class I686UnknownLinuxMusl < Formula
  desc "i686 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }
  version "10.3.0"

  depends_on "zstd"

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/i686-unknown-linux-musl-aarch64-darwin.tar.gz"
    sha256 "06490f7b2928a2d269fdb10aefc34553a9bbc59f5cce5da08215358361ee07c8"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v10.3.0/i686-unknown-linux-musl-x86_64-darwin.tar.gz"
    sha256 "5b6b015c518bf677ec6468c149a47ee7368300b5b5d4d6897b5dbe5e8f522813"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
