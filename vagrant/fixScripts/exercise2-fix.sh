#!/bin/bash
#add fix to exercise2 here
grep -v www.ascii-art.de /etc/hosts | sudo tee /etc/hosts
