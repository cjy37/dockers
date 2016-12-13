FROM registry.cn-hangzhou.aliyuncs.com/joinin/base

RUN apk update && apk upgrade \
  && apk add nodejs \
  && npm uninstall -g npm \
  && rm -rf /var/cache/apk/*
