#!/bin/bash
#solution to the problem where http command failed with http 403 error - forbidden
#problem was that the configuration of the local apache2 denied acces from any
#another problem was to change the body of index.html according to the content in git repo
#the solution was to allow access to any insteadof deny access and update index.html
sudo sed -i 's/deny from all/allow from all/g' /etc/apache2/sites-available/default
sudo sed -i 's/world/from OpsSchool/' /var/www/index.html
sudo /etc/init.d/apache2 restart
