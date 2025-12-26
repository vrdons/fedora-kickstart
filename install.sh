# Install Fedora Server
curl -L -o Fedora-43-Server.iso https://download.fedoraproject.org/pub/fedora/linux/releases/43/Server/x86_64/iso/Fedora-Server-dvd-x86_64-43-1.6.iso

# Create qemu disk
qemu-img create -f qcow2 disk.qcow2 20G
