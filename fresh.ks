# Configure Fedora 43 repos
url --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-43&arch=x86_64"
repo --name=fedora-updates --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=updates-released-f43&arch=x86_64" --cost=0
repo --name=fedora-cisco-openh264 --mirrorlist="https://mirrors.fedoraproject.org/mirrorlist?repo=fedora-cisco-openh264-43&arch=x86_64" --install
repo --name=rpmfusion-free --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-43&arch=x86_64"
repo --name=rpmfusion-free-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-43&arch=x86_64" --cost=0
repo --name=rpmfusion-nonfree --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-43&arch=x86_64"
repo --name=rpmfusion-nonfree-updates --mirrorlist="https://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-43&arch=x86_64" --cost=0
# terra$releasever
repo --name=terra --baseurl="https://repos.fyralabs.com/terra43/"


# Remove all existing partitions
clearpart --all --initlabel


# zerombr
zerombr

# Create required partitions (BIOS boot partition and /boot)
reqpart --add-boot

# Create swap partition (auto-size)
part swap --size=0 --hibernation

# Create / partition
part / --fstype=xfs --size=40000 --grow

# Configure Firewall
firewall --enabled

# Configure Network Interfaces
network --bootproto=dhcp --device=link --activate

# Configure Keyboard Layouts
keyboard --vckeymap=tr --xlayouts=tr

# Configure Language During Installation
lang tr_TR.UTF-8

# Configure Time Zone
timezone Europe/Istanbul

# Perform Installation in Graphical Mode
graphical

# Services to enable/disable
services --enabled=gdm

# Install additional packages
%packages
--excludedocs
--excludeWeakdeps
rpmfusion-free-release
rpmfusion-nonfree-release
dnf-plugins-core

# Install desktop environment
@^workstation-product-environment
@gnome-desktop
@fonts
gnome-tweaks

# Multimedia
@multimedia
vlc
intel-media-driver

# Network
@networkmanager-submodules
firefox

# Office
@libreoffice
libreoffice-langpack-tr

# Dev
@development-tools
rustup
rust-analyzer
zed

# Security
keepassxc

%end


%certificate --filename internal-ca.crt --dir /etc/pki/ca-trust/source/anchors
-----BEGIN CERTIFICATE-----
MIIDfzCCAmegAwIBAgIQYazX7ESZkLxDARAO7Iyu2jANBgkqhkiG9w0BAQsFADBS
MRIwEAYKCZImiZPyLGQBGRYCdHIxEzARBgoJkiaJk/IsZAEZFgNnb3YxFTATBgoJ
kiaJk/IsZAEZFgVtZWJjYTEQMA4GA1UEAxMHZmF0aWhjYTAeFw0xNjAzMDkxNTM2
MjVaFw0zNjAzMDkxNTQ2MjVaMFIxEjAQBgoJkiaJk/IsZAEZFgJ0cjETMBEGCgmS
JomT8ixkARkWA2dvdjEVMBMGCgmSJomT8ixkARkWBW1lYmNhMRAwDgYDVQQDEwdm
YXRpaGNhMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwV3KFFTIoP3Q
j99VEocbGVYbRfAZ7i/tVsjeC7cdNc4m5UJginq68Pwu5Mk32G2Dy1zBoOJYyXyo
nf/KWnaMrp7N/5gCBLw7rNoSS8AXhmMQCw7AECDdcJT4jNIB2xuKY6+xq0SeqhB6
ZohFM/NIP9mEk1pa1RcM3BE/X8qLPxgqnJHCqceuqaut/J/dErcNW1WYjG7REf8G
v+h9bs+IDp0QUtXOt1/117c2aaGPUshXS5Vy4y3D61nDLQBF2sW+kjnVT8nheCkQ
4v5x4Aa9tT7IZJnWAaAAdRl61dZ3c2x+Lawd/47Jzwf3xGAowSV70ctteJ3vYp4O
xkMUa7vYFQIDAQABo1EwTzALBgNVHQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAd
BgNVHQ4EFgQU/vlLQqALawQN3grbFGcX13fSWkowEAYJKwYBBAGCNxUBBAMCAQAw
DQYJKoZIhvcNAQELBQADggEBAIEjFGJQjxqvATP9Lhq4TkuWcc6Pa0Nnc/fKVgsC
LASiDlF5HogcktDSjapO6w+oT3bHvUnEJVsr2TwW0YrdHbuD/ZEsmZ6dYTTPxZtQ
TFPFroMr8yAOs2F+rUOc2wVCmd7GmSz4TWWCsltl5kNrlHZ9/0aGwV2EXwBfmM9z
b8c4THA24LukeCrEGRPVb2IX4ZmG/a6pF1lBuFo27kh2nz98sB4H5sJG5SozWBF/
sfiOV5hYvXQpheBG8HaiMzhjekKgL0rQLno0fgasjrZX3KMkCcxPPoiitu0AFkEB
jB12iv+M0D3N9kmIxeFN6yH7k9rtHUUuXWTSjSB99Fdv6qA=
-----END CERTIFICATE-----
%end

%post
# For Meb CA
update-ca-trust

# Enable/disable GPG keys for installed repos

cat <<EOF >> /etc/yum.repos.d/terra.repo
gpgcheck=0
EOF

# Enable/install copr packages

sudo dnf copr enable g3tchoo/prismlauncher
sudo dnf install prismlauncher

rustup default stable
%end

# Reboot After Installation
reboot --eject
