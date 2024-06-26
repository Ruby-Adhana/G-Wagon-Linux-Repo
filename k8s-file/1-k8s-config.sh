cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf 
overlay 
br_netfilter 
EOF 
sudo modprobe overlay 
sudo modprobe br_netfilter 
cat <<EOF | sudo tee /etc/sysctl.d/99-kubernetes-cri.conf 
net.bridge.bridge-nf-call-iptables = 1 
net.ipv4.ip_forward = 1 
net.bridge.bridge-nf-call-ip6tables = 1 
EOF 
sudo sysctl --system 
lsmod | grep br_netfilter 
lsmod | grep br_netfilter 
