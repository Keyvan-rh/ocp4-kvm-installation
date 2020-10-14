MAC=(00:50:56:11:22:11 00:50:56:11:22:22 00:50:56:11:22:33)
for m in {0..2}
do 
  i=master${m}
  #echo ${i}
  virt-install --name="ocp4-${i}" --vcpus=4 --ram=27000 \
  --disk path=/mnt/data/images/ocp4-${i}.qcow2,bus=virtio,size=120 \
  --os-variant rhel8.0 --network bridge=br0,model=virtio \
  --mac=${MAC[${m}]} \
  --boot hd,network,menu=on --print-xml > ocp4-$i.xml
  virsh define --file ocp4-$i.xml
  #echo ${MAC[${m}]}
done
