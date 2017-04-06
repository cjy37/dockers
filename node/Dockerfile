FROM registry.cn-hangzhou.aliyuncs.com/joinin/base

COPY entrypoint.sh /sbin/entrypoint.sh

RUN apk update && apk upgrade \
  && apk add nodejs \
  && npm uninstall -g npm \
  && rm -rf /var/cache/apk/* \
  && chmod 755 /sbin/entrypoint.sh && mkdir -p /root

EXPOSE 80
WORKDIR /wwwroot/htdocs/www
CMD ["/sbin/entrypoint.sh"]
