nmcli con show
nmcli conn add type bridge con-name br0 ifname br0
nmcli conn modify br0 ipv4.addresses '192.168.1.6/24'
nmcli conn modify br0 ipv4.gateway '192.168.1.1'
nmcli conn modify br0 ipv4.dns '192.168.1.1'
nmcli conn modify br0 ipv4.method manual
nmcli conn show br0
nmcli con show
nmcli conn add type ethernet slave-type bridge con-name bridge-br0 ifname eno1 master br0
nmcli con show
nmcli conn up br0
nmcli con show
nmcli conn down eno1
bridge link show
