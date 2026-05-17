export RUSTC_WRAPPER=$(which sccache)
export CC="sccache clang"
export CXX="sccache clang++"
export CMAKE_C_COMPILER_LAUNCHER=sccache
export CMAKE_CXX_COMPILER_LAUNCHER=sccache
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$PATH"
