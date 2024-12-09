gcc -o mini_server main.c -lfcgi
cp ./nginx.conf /etc/nginx/nginx.conf
nginx -s reload
spawn-fcgi -p 8080 -n ./mini_server
