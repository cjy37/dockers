#!/bin/sh

echo 65535 > /proc/sys/net/core/somaxconn
echo never > /sys/kernel/mm/transparent_hugepage/enabled

redis-server /etc/redis/redis.conf