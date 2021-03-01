# arm-macos-ct
ARM based macOS cross compiler toolchains

Download precompiled toolchains from [GitHub Release](https://github.com/messense/arm-macos-ct/releases)

## Use with Rust

Suppose you have downloaded `x86_64-unknown-linux-gnu` toolchain and extracted it to `$HOME/.local/xtools/x86_64-unknown-linux-gnu`,
setup the environment variables as below to use it with Cargo.

```bash
# Add to PATH
export PATH=$HOME/.local/xtools/x86_64-unknown-linux-gnu/bin:$PATH

export CC_x86_64_unknown_linux_gnu=x86_64-unknown-linux-gnu-gcc
export CXX_x86_64_unknown_linux_gnu=x86_64-unknown-linux-gnu-g++
export AR_x86_64_unknown_linux_gnu=x86_64-unknown-linux-gnu-ar
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER=x86_64-unknown-linux-gnu-gcc
```
