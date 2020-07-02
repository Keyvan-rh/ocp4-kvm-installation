virsh pool-destroy default
virsh pool-undefine default
# Second disk is mount under /mnt
virsh pool-define-as --name default --type dir --target /mnt/data/images
virsh pool-list
virsh pool-autostart default
virsh pool-list
virsh pool-start default
virsh pool-list
chmod a+x /mnt
