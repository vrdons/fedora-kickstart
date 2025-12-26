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
