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

    server_name ${ADMIN_DOMAIN};

    #root /wwwroot/htdocs/admin;
    #index index.html index.htm;

    location / {

        proxy_pass http://admin;
        
        proxy_redirect off;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header Host ${ADMIN_HOST};

        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";

        #sendfile       on;
        tcp_nopush     on;
        aio            on;
    }

    location /joincas {
        proxy_pass http://cas;
        proxy_redirect off;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header Host \$host;
        
        #sendfile       on;
        tcp_nopush     on;
        aio            on;
    }
}

server {
    listen ${API_PORT};
    listen [::]:${API_PORT};

    server_name ${API_DOMAIN};

    location / {
        proxy_pass http://api;
        proxy_redirect off;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
        proxy_set_header Host ${API_HOST};

        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";

        #sendfile       on;
        tcp_nopush     on;
        aio            on;
    }
}
EOF