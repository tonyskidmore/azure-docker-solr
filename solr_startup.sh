#!/bin/bash

# export SOLR_PORT=${PORT}
export SOLR_PORT=8983

# starting sshd process
sed -i "s/SSH_PORT/$SSH_PORT/g" /etc/ssh/sshd_config
/usr/sbin/sshd
