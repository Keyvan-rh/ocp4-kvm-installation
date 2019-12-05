MAC=(52:54:00:f4:26:a1 52:54:00:82:90:00 52:54:00:8e:10:34)
for m in {0..2}
do
  i=worker${m}
  virt-install --name="ocp4-${i}" --vcpus=4 --ram=12288 \
  --disk path=/mnt/data/images/ocp4-${i}.qcow2,bus=virtio,size=120 \
  --os-variant rhel8.0 --network bridge=br0,model=virtio \
  --mac=${MAC[${m}]} \
  --boot menu=on --print-xml > ocp4-$i.xml
  virsh define --file ocp4-$i.xml
done
