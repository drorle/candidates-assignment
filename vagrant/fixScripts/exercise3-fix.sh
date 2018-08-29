#!/bin/bash
#add fix to exercise3 here
sed 's/deny from/allow from/' /etc/apache2/sites-available/default | sudo tee /etc/apache2/sites-available/default
service apache2 restart
