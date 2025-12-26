# Start qemu
qemu-system-x86_64 \
	-enable-kvm \
	-m 4096 \
	-cpu host \
	-drive file=disk.qcow2,format=qcow2
