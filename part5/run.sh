#!/bin/bash

gcc -o server main.c -lfcgi
spawn-fcgi -p 8080 ./server
nginx -g "daemon off;"
chmod +x run.sh
