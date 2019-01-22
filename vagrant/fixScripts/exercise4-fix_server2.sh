#!/bin/bash
#solution to the problem where ssh command to server1failed 
#problem was that the hostname server1 was not resolved (didn't appear in any resolution file)
#the solution is to add it to /etc/hosts file in case it does not exist
if ! ( grep -lq '192.168.100.10' /etc/hosts ) ; then sudo sed -i "\$a192.168.100.10 server1 Server1" /etc/hosts >> /dev/null ; fi
