class X8664UnknownLinuxGnu < Formula
  desc "x86_64 Linux GNU Toolchain"
  homepage "https://github.com/messense/macos-cross-toolchains"
  license "GPL-3.0-or-later" => { with: "GCC-exception-3.1" }

  if Hardware::CPU.arm?
    url = "https://github.com/messense/macos-cross-toolchains/releases/download/v1.1.0/x86_64-unknown-linux-gnu-aarch64-darwin-glibc-2.12.1.zip"
    version = "10.2.0"
    sha256 = "b0e6f6734890dcb69ec00b3476936a4d8a296625e41fb344f3a955bcb0e2f9bf"
  else
    url = "https://github.com/messense/macos-cross-toolchains/releases/download/v1.1.0/x86_64-unknown-linux-gnu-x86_64-darwin-glibc-2.12.1.zip"
    sha256 = "be2989980202a23a51ee0a8f2e0b44c980169f25c980dce9a02d0826f0111ee4"
  end

  def install
    (prefix/"toolchain").install Dir["./*"]
    Dir.glob(prefix/"toolchain/bin/*") {|file| bin.install_symlink file}
  end
end
