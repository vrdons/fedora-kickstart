url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-43&arch=x86_64"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f43&arch=x86_64" --cost=0
repo --name=fedora-cisco-openh264 --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-cisco-openh264-43&arch=x86_64" --install
repo --name=rpmfusion-free --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-43&arch=x86_64"
repo --name=rpmfusion-free-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-43&arch=x86_64" --cost=0
repo --name=rpmfusion-nonfree --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-43&arch=x86_64"
repo --name=rpmfusion-nonfree-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-43&arch=x86_64" --cost=0

# Remove all existing partitions
clearpart --all --initlabel

# zerombr
zerombr

# Create required partitions (BIOS boot partition and /boot)
reqpart --add-boot

# Create swap partition (auto-size)
part swap --size=0 --hibernation

# Create / (root) partition
part / --fstype=xfs --size=40000 --grow

# Configure Firewall
firewall --enabled

# Configure Network Interface
network --bootproto=dhcp --device=link --activate

# Configure Keyboard Layouts
keyboard --vckeymap=tr --xlayouts=tr

# Configure Language During Installation
lang tr_TR.UTF-8

# Configure Time Zone
timezone Europe/Istanbul

# Perform Installation in Graphical Mode
graphical

# Set xconfig to start on boot
xconfig --startxonboot

# Services to enable/disable
services --enabled=gdm

# Install additional packages
%packages --excludedocs --excludeWeakdeps
# Needed
rpmfusion-free-release
rpmfusion-nonfree-release
dnf-plugins-core

# Desktop environment
@^workstation-product-environment
@gnome-desktop
@fonts
gnome-tweaks

# Multimedia
@multimedia
vlc
intel-media-driver

# Office
@libreoffice
libreoffice-langpack-tr

%end
# Reboot After Installation
reboot --eject
