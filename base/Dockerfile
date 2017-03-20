FROM alpine:3.5

# 修改为国内镜像源
RUN echo "http://mirrors.aliyun.com/alpine/v3.5/main/" > /etc/apk/repositories

RUN apk update && apk upgrade \
  && apk add ca-certificates \
  && rm -rf /var/cache/apk/*