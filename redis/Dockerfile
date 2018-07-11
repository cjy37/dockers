FROM redis:3

MAINTAINER Chen Jingyuan <rocky.cn@foxmail.com>

COPY redis.conf /etc/redis/redis.conf
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

CMD ["/sbin/entrypoint.sh"]
