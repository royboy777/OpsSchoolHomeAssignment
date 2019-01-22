#!/bin/bash
#solution to the problem where ssh command to server2 failed 
#problem was that the hostname server2 was not resolved (didn't appear in any resolution file
#the solution is to add it to /etc/hosts file in case it does not exist
if ! ( grep -lq '192.168.100.11' /etc/hosts ) ; then sudo sed -i "\$a192.168.100.11 server2 Server2" /etc/hosts >> /dev/null ; fi
