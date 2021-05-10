class X8664UnknownLinuxMusl < Formula
  desc "x86_64 Linux MUSL Toolchain"
  homepage "https://github.com/messense/homebrew-macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }

  if Hardware::CPU.arm?
    url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.2.0/x86_64-unknown-linux-musl-aarch64-darwin.tar.gz"
    version "10.2.0"
    sha256 "6970f1686eb94302216e9a20fc35557c37c7f053b1098a0adac2cb58f44f586d"
  else
    # url "https://github.com/messense/homebrew-macos-cross-toolchains/releases/download/v1.2.0/x86_64-unknown-linux-musl-x86_64-darwin.tar.gz"
    # version "10.2.0"
    # sha256 "591061e8753b28907d0dc9f5e9c52b933b6b6993077673bca53d74f7ac969be2"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
