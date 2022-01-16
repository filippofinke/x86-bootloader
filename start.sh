rm boot.bin 2> /dev/null
echo "Compiling..."
nasm -o boot.bin boot.asm
echo "Starting QEMU"
qemu-system-x86_64 -drive format=raw,file=boot.bin