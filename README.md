# macos-cross-toolchains

> 🚀 Help me to become a full-time open-source developer by [sponsoring me on GitHub](https://github.com/sponsors/messense)

macOS cross compiler toolchains, supports both Apple Silicon & Intel Macs.

Download precompiled toolchains from [GitHub Release](https://github.com/messense/homebrew-macos-cross-toolchains/releases)

Or install using Homebrew:

```bash
brew tap messense/macos-cross-toolchains
# install x86_64-unknown-linux-gnu toolchain
brew install x86_64-unknown-linux-gnu
# install aarch64-unknown-linux-gnu toolchain
brew install aarch64-unknown-linux-gnu
```

## Use with Rust

Suppose you have installed `x86_64-unknown-linux-gnu` toolchain and have it on `PATH`,
setup the environment variables as below to use it with Cargo.

```bash
export CC_x86_64_unknown_linux_gnu=x86_64-unknown-linux-gnu-gcc
export CXX_x86_64_unknown_linux_gnu=x86_64-unknown-linux-gnu-g++
export AR_x86_64_unknown_linux_gnu=x86_64-unknown-linux-gnu-ar
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-unknown-linux-gnu-gcc
```
