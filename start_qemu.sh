qemu-system-x86_64 \
  -enable-kvm \
  -m 4096 \
  -cpu host \
  -drive file=fedora.qcow2,format=qcow2 \
  -cdrom Fedora-Server-dvd-x86_64-43-1.6.iso \
  -kernel /mnt/images/pxeboot/vmlinuz \
  -initrd /mnt/images/pxeboot/initrd.img \
  -append "inst.stage2=cdrom inst.ks=http://10.0.2.2:8000/fresh.ks" \
  -boot d
