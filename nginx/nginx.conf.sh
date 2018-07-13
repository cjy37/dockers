#!/bin/sh

tee /etc/nginx/nginx.conf <<-EOF
user nginx;

worker_processes 8;

error_log  /var/log/nginx/error.log warn;
pid        /var/run/nginx.pid;

events {
    worker_connections 50000;
    multi_accept on;
}

http {

    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    ##
    # Logging Settings
    ##

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    ##
    # Basic Settings
    ##
    sendfile off;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 180;
    types_hash_max_size 2048;
    # server_tokens off;
    server_names_hash_bucket_size 64;
    client_header_buffer_size 32k;
    large_client_header_buffers 4 32k;
    client_max_body_size 300m;
    # server_name_in_redirect off;
    client_body_buffer_size 512k;
    proxy_connect_timeout 20;
    proxy_read_timeout 120;
    proxy_send_timeout 60;
    proxy_buffer_size 64k;
    proxy_buffers 4 128k;
    proxy_busy_buffers_size 128k;
    #proxy_temp_file_write_size 128k;


    ##
    # Gzip Settings
    ##
    gzip off;
    gzip_disable "msie6";
    gzip_min_length 1k;
    gzip_vary on;
    # gzip_proxied any;
    gzip_comp_level 1;
    gzip_buffers 4 16k;
    gzip_http_version 1.0;
    gzip_proxied private;
    gzip_types text/plain text/css application/javascript application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript;

    # proxy_temp_path /wwwroot/nginx_temp;
    # #设置Web缓存区名称为cache_one，内存缓存空间大小为200MB，1天没有被访问的内容自动清除，硬盘缓存空间大小为30GB。
    # proxy_cache_path /wwwroot/nginx_cache levels=1:2 keys_zone=cache_one:200m inactive=1d max_size=30g;

    include /etc/nginx/conf.d/*.conf;
}
EOF