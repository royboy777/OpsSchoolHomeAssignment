#!/bin/bash
#Solution to the issue of Password-less ssh implemented on server1 in order to ssh server2 without password
#This is by implementing procedure for that , including : generating key in case not exist already, chmod to authorized_keys
ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa
sudo chown -R vagrant:vagrant /home/vagrant/.ssh/
chmod 600 ~/.ssh/authorized_keys
