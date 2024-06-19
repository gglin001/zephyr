###############################################################################

cmake --preset hello_world_riscv -S samples/hello_world

cmake --build build

###############################################################################

# build/zephyr/zephyr.elf

###############################################################################

args=(
  -machine virt
  # -cpu rv64,g=true,v=true,vext_spec=v1.0
  -cpu rv64
  # -semihosting-config enable=on # semihost
  -m 256
  -nographic
  -bios none
  # -monitor none
  # -serial none
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
