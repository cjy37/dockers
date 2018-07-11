FROM redis:3

MAINTAINER Chen Jingyuan <rocky.cn@foxmail.com>

COPY redis.conf /etc/redis/redis.conf
RUN echo 65535 > /wproc/sys/net/core/somaxconn
ENTRYPOINT ["redis-server", "/etc/redis/redis.conf"]
