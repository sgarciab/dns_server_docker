sudo docker network create --subnet=172.20.0.0/16 ironsale-net
sudo docker build -t bind9 .
sudo docker run -d --rm --name=dns-server --net=ironsale-net --ip=172.20.0.2 bind9
sudo docker exec -d dns-server /etc/init.d/bind9 start
sudo docker run -d --rm --name=host2 --net=ironsale-net --ip=172.20.0.4 --dns=172.20.0.2 ubuntu:bionic /bin/bash -c "while :; do sleep 10; done"
