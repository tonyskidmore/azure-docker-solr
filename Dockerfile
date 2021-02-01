FROM solr:8.7.0

USER root

# https://docs.microsoft.com/en-gb/azure/app-service/configure-custom-container?pivots=container-linux#enable-ssh
RUN apt-get update \
  && apt-get install -y openssh-server \
  && echo "root:Docker!" | chpasswd

# https://github.com/Azure-App-Service/node/blob/master/10.14/sshd_config
COPY sshd_config /etc/ssh/

# https://github.com/docker-solr/docker-solr/issues/247
COPY --chown=solr solr_startup.sh /docker-entrypoint-initdb.d/solr_startup.sh

ENV SSH_PORT 2222
EXPOSE 2222
