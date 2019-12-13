for m in {0..2}
do
  i=master${m}
  #echo ${i}
  virsh destroy "ocp4-${i}"
  i=worker${m}
  virsh destroy "ocp4-${i}"
done
virsh destroy "ocp4-bootstrap"
for m in {0..2}
do
  i=master${m}
  #echo ${i}
  virsh undefine "ocp4-${i}"
  i=worker${m}
  virsh undefine "ocp4-${i}"
done
virsh undefine "ocp4-bootstrap"
rm -f /mnt/data/images/ocp4-master*
rm -f /mnt/data/images/ocp4-worker*
rm -f /mnt/data/images/ocp4-bootstrap.qcow2
