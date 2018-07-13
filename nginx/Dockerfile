FROM nginx:alpine

MAINTAINER Chen Jingyuan <rocky.cn@foxmail.com>

COPY default.conf.sh /etc/nginx/conf.d/

COPY nginx.conf.sh /etc/nginx/

COPY entrypoint.sh /sbin/entrypoint.sh

RUN chmod 755 /sbin/entrypoint.sh && \
    chmod 755 /etc/nginx/conf.d/default.conf.sh && \
    chmod 755 /etc/nginx/nginx.conf.sh

CMD ["nginx", "-g", "daemon off;"]
