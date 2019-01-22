#!/bin/bash
#fix to problem where curl resulted in failure - curl: (7) couldn't connect to host
#this was due to networking issue - the request didn't reach the router/vagrant host to the external network
#but stayed in the private network 192.168.x.x
#the solution was to refer it to the gw with the ip of router/vagrant host
sudo route del -net 208.86.224.90 netmask 255.255.255.255 gw 0.0.0.0
sudo route add -net 208.86.224.90 netmask 255.255.255.255 gw 10.0.2.2
