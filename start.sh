# Mount Fedora server for kernel (needed by inst.ks)
sudo mount -o loop Fedora-43-Server.iso /mnt

# Start http server to see install.ks
python3 -m http.server 8000 &
HTTP_PID=$!

# Start qemu
qemu-system-x86_64 \
	-enable-kvm \
	-m 4096 \
	-cpu host \
	-drive file=disk.qcow2,format=qcow2 \
	-cdrom Fedora-43-Server.iso \
	-kernel /mnt/images/pxeboot/vmlinuz \
	-initrd /mnt/images/pxeboot/initrd.img \
	-append "inst.stage2=cdrom inst.ks=http://10.0.2.2:8000/install.ks" \
	-boot d

# Unmount /mnt for next process
sudo umount /mnt

# Kill http server for next process
kill $HTTP_PID
