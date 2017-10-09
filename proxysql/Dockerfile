FROM prima/proxysql:1.3.0f

RUN apt-get update && \
    apt-get install -y awscli mysql-client vim net-tools curl && \
    rm -r /var/lib/apt/lists/*
