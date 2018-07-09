FROM alpine:3.7

# 修改为国内镜像源
RUN echo 'https://mirrors.aliyun.com/alpine/v3.7/main' > /etc/apk/repositories \
 && echo 'https://mirrors.aliyun.com/alpine/v3.7/community' >> /etc/apk/repositories
 
RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache curl ca-certificates openssl \
	&& apk add --update ca-certificates openssl \
	&& update-ca-certificates \
    && rm -rf /var/cache/apk/*