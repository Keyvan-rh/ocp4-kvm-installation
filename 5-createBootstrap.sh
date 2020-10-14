MAC=(52:54:00:60:72:67)
for m in {0..0}
do
  i=bootstrap
  virt-install --name="ocp4-${i}" --vcpus=4 --ram=12288 \
  --disk path=/mnt/data/images/ocp4-${i}.qcow2,bus=virtio,size=120 \
  --os-variant rhel8.0 --network bridge=br0,model=virtio \
  --mac=${MAC[${m}]} \
  --boot hd,network,menu=on --print-xml > ocp4-$i.xml
  virsh define --file ocp4-$i.xml
done
