FROM debian:jessie

MAINTAINER Chen Jingyuan <andreausu@gmail.com>

RUN apt-get update && \
    apt-get install -y wget awscli mysql-client vim net-tools curl && \
    wget https://github.com/sysown/proxysql/releases/download/v1.4.3/proxysql_1.4.3-debian8_amd64.deb -O /opt/proxysql_1.4.3-debian8_amd64.deb && \
    dpkg -i /opt/proxysql_1.4.3-debian8_amd64.deb && \
    rm -f /opt/proxysql_1.4.3-debian8_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["proxysql", "-f"]
