MAC=(52:54:00:e7:9d:67 52:54:00:80:16:23 52:54:00:d5:1c:39)
for m in {0..2}
do 
  i=master${m}
  #echo ${i}
  virt-install --name="ocp4-${i}" --vcpus=4 --ram=10000 \
  --disk path=/mnt/data/images/ocp4-${i}.qcow2,bus=virtio,size=120 \
  --os-variant rhel8.0 --network bridge=br0,model=virtio \
  --mac=${MAC[${m}]} \
  --boot hd,network,menu=on --print-xml > ocp4-$i.xml
  virsh define --file ocp4-$i.xml
  #echo ${MAC[${m}]}
done
