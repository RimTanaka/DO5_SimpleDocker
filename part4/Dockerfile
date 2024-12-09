FROM nginx

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./main.c /home/main.c
COPY ./run.sh /home/run.sh
RUN apt update && apt install -y gcc spawn-fcgi libfcgi-dev lsof
WORKDIR /home/
ENTRYPOINT ["sh", "/home/run.sh"]