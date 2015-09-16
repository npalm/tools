#! /bin/bash
echo '============ INSTALLING DOCKER ============'
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
sh -c "echo deb https://get.docker.com/ubuntu docker main\
     > /etc/apt/sources.list.d/docker.list"

apt-get update

# Add docker group and users to docker group, for some reason this is not working at the moment
groupadd docker
gpasswd -a $defaultuser docker
apt-get install cgroup-lite apparmor linux-image-extra-$(uname -r) python-setuptools python-pip python-dev build-essential aufs-tools -y
modprobe aufs
apt-get install lxc-docker -y

sh -c 'echo DOCKER_OPTS=\"-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock\" > /etc/default/docker'
sh -c "echo 127.0.2.1   dockerhost >> /etc/hosts"

pip install -U docker-compose

service docker restart
