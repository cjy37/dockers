FROM registry.cn-hangzhou.aliyuncs.com/joinin/base

COPY entrypoint.sh /sbin/entrypoint.sh

RUN apk update && apk upgrade \
  && apk add nodejs \
  && npm uninstall -g npm \
  && rm -rf /var/cache/apk/*

RUN chmod 755 /sbin/entrypoint.sh && mkdir -p /root

# ENTRYPOINT ["npm", "install"]

EXPOSE 80

CMD ["/sbin/entrypoint.sh"]
