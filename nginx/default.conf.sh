#!/bin/sh

tee /etc/nginx/conf.d/default.conf <<-EOF
upstream admin {
    server ${ADMIN_URL};
}
upstream api {
    server ${API_URL};
}
upstream cas {
    server ${CAS_URL};
}

server {
    listen ${ADMIN_PORT} default_server;
    listen [::]:${ADMIN_PORT} default_server;

    server_name _ ${ADMIN_DOMAIN};

    #root /wwwroot/htdocs/admin;
    #index index.html index.htm;

    location / {
        # proxy_next_upstream http_500 http_502 http_503 http_504 error timeout invalid_header;
        # proxy_cache cache_one;
        # proxy_cache_valid any 10s;
        # proxy_cache_valid 200 304 7d;
        # proxy_cache_valid 301 3d;
        # proxy_cache_key \$host\$uri\$is_args\$args;
        proxy_redirect off;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header Host \$host;

        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";

        #sendfile       on;
        tcp_nopush     on;
        aio            on;

        proxy_pass http://admin;
    }

    location /joincas {
        proxy_redirect off;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header Host \$host;

        # proxy_http_version 1.1;
        # proxy_set_header Upgrade \$http_upgrade;
        # proxy_set_header Connection "upgrade";

        #sendfile       on;
        tcp_nopush     on;
        aio            on;

        proxy_pass http://cas;
    }
}

server {
    listen ${API_PORT};
    listen [::]:${API_PORT};

    server_name server_name ${API_DOMAIN};

    #root /wwwroot/htdocs/admin;
    #index index.html index.htm;

    location / {
        # proxy_next_upstream http_500 http_502 http_503 http_504 error timeout invalid_header;
        # proxy_cache cache_one;
        # proxy_cache_valid any 10s;
        # proxy_cache_valid 200 304 7d;
        # proxy_cache_valid 301 3d;
        # proxy_cache_key \$host\$uri\$is_args\$args;
        proxy_redirect off;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header Host \$host;

        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";

        #sendfile       on;
        tcp_nopush     on;
        aio            on;

        proxy_pass http://api;
    }
}
EOF