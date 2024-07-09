###############################################################################

# ln -s /Users/allen/repos/_BLOGS/riscv-toolchain/llvm-project/build/install \
#   $PWD/riscv-toolchain

###############################################################################

cmake --preset riscv_clang -S samples/posix/philosophers

cmake --build build

###############################################################################

args=(
  -machine virt
  # -cpu rv64,v=true,vext_spec=v1.0
  -cpu rv64
  -semihosting-config enable=on # semihost
  -m 256
  -nographic
  -bios none
  -monitor none
  -serial stdio
  #
  # -d out_asm
  # -d in_asm
  # -d cpu
  # -d exec
  # -d op
  #
  -kernel build/zephyr/zephyr.elf
)
qemu-system-riscv64 "${args[@]}"

###############################################################################
