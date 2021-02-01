#!/bin/bash
set -e
echo "This runs at container start"

# export SOLR_PORT=8983

# starting sshd process
# sed -i "s/SSH_PORT/$SSH_PORT/g" /etc/ssh/sshd_config
sudo -n /usr/sbin/sshd

export SOLR_PORT="$PORT"
echo "SOLR_PORT=$PORT"
touch /tmp/solr_startup.test
