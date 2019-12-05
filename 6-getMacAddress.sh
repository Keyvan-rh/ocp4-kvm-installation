for i in bootstrap master{0..2} worker{0..2}
do
  echo -ne "${i}\t" ; virsh dumpxml ocp4-${i} | grep "mac address" | cut -d\' -f2
done
