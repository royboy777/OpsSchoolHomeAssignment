#!/bin/bash
#Solution to the issue of Password-less ssh implemented on server2 in order to ssh server2 without password
#most of the work of the procedure should be placed on script run on server2 , since it should be implemented only after both
#servers are up and running
#This is by implementing procedure for that , including : generating key in case not exist already, chmod to authorized_keys
#Installing sshpass (in order to copy file to remote server) , copy the id_rsa.pub file to server1, adding it to server1 authorized_keys
#adding server2 key to known_host of server1 , copy the id_rsa.pub file of server1 to server2, adding it to server2 authorized_keys
#adding server1 key to known_host of server2, delete the id_rsa.pub on server2
ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
chmod 600 ~/.ssh/authorized_keys
sudo apt-get update
sudo apt-get install sshpass
cat /home/vagrant/.ssh/id_rsa.pub | sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@192.168.100.10 "cat >> /home/vagrant/.ssh/authorized_keys && ssh-keyscan -t rsa 192.168.100.11,server2 >> ~/.ssh/known_hosts"
sshpass -p "vagrant" scp -o StrictHostKeyChecking=no vagrant@192.168.100.10:/home/vagrant/.ssh/id_rsa.pub /home/vagrant/.ssh/id_rsa.pub
cat /home/vagrant/.ssh/id_rsa.pub >>  /home/vagrant/.ssh/authorized_keys
sshpass -p "vagrant" ssh -o StrictHostKeyChecking=no vagrant@192.168.100.10 "rm -f /home/vagrant/.ssh/id_rsa.pub"
ssh-keyscan -t rsa 192.168.100.10,server1 >> /home/vagrant/.ssh/known_hosts
sudo chown -R vagrant:vagrant /home/vagrant/.ssh/
rm -f /home/vagrant/.ssh/id_rsa.pub
