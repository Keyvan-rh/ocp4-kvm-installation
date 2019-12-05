rm /mnt/data/images/ocp4-aHelper.qcow2
virt-install --name="ocp4-aHelper" --vcpus=2 --ram=4096 \
--disk path=/mnt/data/images/ocp4-aHelper.qcow2,bus=virtio,size=30 \
--os-variant centos7.0 --network bridge=br0,model=virtio \
--mac=52:54:00:ab:2d:c6 \
--boot menu=on --location /home/keyvan/Downloads/CentOS-7-x86_64-Everything-1908.iso \
--initrd-inject helper-ks.cfg --extra-args "inst.ks=file:/helper-ks.cfg" --noautoconsole
