FROM ubuntu:14.04

#installing openssh
RUN apt-get update
RUN apt-get install openssh-server -y

#installing other tools
RUN apt-get install curl wget jq telnet git make zip -y

# installing mysql-client
RUN apt-get install mysql-client -y

# installing mongodb-client
RUN apt-get install mongodb-clients -y

# installing redis-client
RUN apt-get install redis-tools -y

# installing postgres client
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN apt-get update
RUN apt-get install postgresql-client-9.4 -y

COPY setup-jumpbox.sh /setup-jumpbox.sh
COPY authorized_keys /etc/secrets/authorized_keys
EXPOSE 22

ENTRYPOINT /setup-jumpbox.sh
