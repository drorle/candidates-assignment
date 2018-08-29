#!/bin/bash
#add fix to exercise5-server1 here

#check for common private key and create if required
[ -f /vagrant/id_rsa ] || {
  su - vagrant -c "ssh-keygen -t rsa -f /vagrant/id_rsa -q -N ''"
}

#deploy key to vagrant user
[ -f /home/vagrant/.ssh/id_rsa ] || {
    cp /vagrant/id_rsa /home/vagrant/.ssh/id_rsa
    chmod 0600 /home/vagrant/.ssh/id_rsa
    chown vagrant /home/vagrant/.ssh/id_rsa
}

#allow passwordless ssh
grep 'vagrant@server' ~vagrant/.ssh/authorized_keys &>/dev/null || {
  cat /vagrant/id_rsa.pub >> ~vagrant/.ssh/authorized_keys
  chmod 0600 ~vagrant/.ssh/authorized_keys
}

#exclude other server from host checking
cat > ~vagrant/.ssh/config <<EOF
Host server2
   StrictHostKeyChecking no
   UserKnownHostsFile=/dev/null
EOF
