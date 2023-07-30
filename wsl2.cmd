wsl --install -d Ubuntu-22.04
#wsl -d Ubuntu-22.04 -u ubuntu2204
wsl -d Ubuntu-22.04 -u root
apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
touch /usr/share/keyrings/docker-archive-keyring.gpg \
  || curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg \
  && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list
apt update

apt-get install docker-ce docker-ce-cli containerd.io
usermod -aG docker $USER && newgrp docker

update-alternatives --set iptables /usr/sbin/iptables-legacy
update-alternatives --set ip6tables /usr/sbin/ip6tables-legacy

service docker start
service docker status

#docker run hello-world
#docker images
#docker rmi hello-world -f
#docker images

# 以下、kubernetes ローカルには不要
#apt install -y git
git clone https://github.com/asdf-vm/asdf.git ~/.asdf

grep '# asdf setting' ~/.bashrc || cat <<EOF >> ~/.bashrc

# asdf setting
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
EOF

exec $SHELL -l

#install minikube
asdf plugin-add minikube
asdf list-all minikube # versions will be listed
#asdf install minikube <version>
#asdf install minikube 1.30.1
#asdf global minikube <version>
#asdf global minikube 1.30.1
minikube start --vm-driver=docker
minikube start --vm-driver=docker --force
minikube version
minikube status

#install kubectl
asdf plugin-add kubectl
asdf list-all kubectl # versions will be listed
#asdf install kubectl <version>
#asdf install kubectl 1.27.1
#asdf global kubectl <version>
#asdf global kubectl 1.27.1
kubectl version
kubectl cluster-info

#run hello-world
kubectl run hello-world --image hello-world --restart=Never
kubectl get pod
kubectl describe pod/hello-world #kubectl describe <Name>
kubectl logs pod/hello-world
kubectl delete pod/hello-world
kubectl get pod

