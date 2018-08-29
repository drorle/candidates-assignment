#!/bin/bash
#add fix to exercise3 here
sed 's/deny from all/allow from all/' /etc/apache2/sites-available/default | sudo tee /etc/apache2/sites-available/default
sudo service apache2 restart
