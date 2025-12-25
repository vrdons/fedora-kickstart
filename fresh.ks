# Configure Fedora 43 repos
url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-43&arch=x86_64"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f43&arch=x86_64" --cost=0
repo --name=fedora-cisco-openh264 --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-cisco-openh264-43&arch=x86_64" --install
repo --name=rpmfusion-free --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-43&arch=x86_64"
repo --name=rpmfusion-free-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-43&arch=x86_64" --cost=0
repo --name=rpmfusion-nonfree --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-43&arch=x86_64"
repo --name=rpmfusion-nonfree-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-43&arch=x86_64" --cost=0
