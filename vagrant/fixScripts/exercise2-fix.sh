#!/bin/bash
#add fix to exercise2 here
grep -v www.ascii-art.de /etc/hosts > /tmp/hosts
sudo mv /tmp/hosts /etc/hosts
