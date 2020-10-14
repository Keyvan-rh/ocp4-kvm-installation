virsh start "ocp4-bootstrap"
sleep 5m
for m in {0..2}
do
  i=master${m}
  #echo ${i}
  virsh start "ocp4-${i}"
  sleep 1m
done
for m in {0..2}
do
  i=worker${m}
  #echo ${i}
  virsh start "ocp4-${i}"
  sleep 1m
done
