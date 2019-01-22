#!/bin/bash
#solution to the problem where curl command failed with http 403 error - forbidden
#problem was that the hostname/domain name was in /etc/hosts and referred to localhost
#which actually got to the local apache where the file does not exists ascii/ab/007.txt
#the solution is to delete the entry from /etc/hosts so it will perform correct dns resolution
sudo sed -i '/www.ascii-art.de/d' /etc/hosts
