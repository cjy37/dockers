FROM debian:jessie

MAINTAINER Chen Jingyuan <andreausu@gmail.com>

RUN apt-get update && \
    apt-get install -y wget awscli mysql-client vim net-tools curl && \
    wget https://github.com/sysown/proxysql/releases/download/v1.4.3/proxysql_1.4.3-debian8_amd64.deb -O /opt/proxysql_1.4.3-debian8_amd64.deb && \
    dpkg -i /opt/proxysql_1.4.3-debian8_amd64.deb && \
    mkdir -p /etc/proxysql && \
    rm -f /opt/proxysql_1.4.3-debian8_amd64.deb && \
    rm -rf /var/lib/apt/lists/*

COPY proxysql.conf /etc/proxysql/proxysql.conf

EXPOSE 6032 3306

ENTRYPOINT ["proxysql", "-f", "-c", "/etc/proxysql/proxysql.conf"]
