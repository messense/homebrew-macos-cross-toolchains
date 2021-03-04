class I686UnknownLinuxGnu < Formula
  desc "i686 Linux GNU Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.2.0/i686-unknown-linux-gnu-aarch64-darwin.tar.gz"
    version "10.2.0"
    sha256 "7c99ada64c92d427e690d0ff532b7fdfa9f8c63aa5638a64490897554a3c7dfd"
  else
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.2.0/i686-unknown-linux-gnu-x86_64-darwin.tar.gz"
    version "10.2.0"
    sha256 "314ae8ec1edd7d300503bf358a4de8b961b57e4bbd6281d684bd049fcad35b0f"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
