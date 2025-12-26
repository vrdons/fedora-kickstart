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


# Perform Installation in Graphical Mode
graphical
