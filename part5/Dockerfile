FROM nginx
WORKDIR /home/

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./main.c /home/main.c
COPY ./run.sh /home/run.sh

USER root

RUN apt update && apt install -y gcc spawn-fcgi libfcgi-dev lsof; \
    chown -R nginx:nginx /var/cache/nginx; \
    chown -R nginx:nginx /home; \
    touch /var/run/nginx.pid; \
    chown -R nginx:nginx /var/run/nginx.pid; \
    rm -rf /var/lib/apt/lists

# Безопасные права для конкрет файловCIS-DI-0008
RUN chmod u-s /usr/bin/passwd && \
    chmod u-s /usr/bin/chfn && \
    chmod u-s /usr/bin/chsh && \
    chmod u-s /usr/bin/su && \
    chmod u-s /usr/bin/gpasswd && \
    chmod u-s /usr/bin/newgrp && \
    chmod u-s /usr/bin/mount && \
    chmod g-s /usr/bin/expiry && \
    chmod g-s /usr/sbin/unix_chkpwd && \
    chmod g-s /usr/bin/chage && \
    chmod u-s /usr/bin/umount

USER nginx

ENTRYPOINT ["sh", "/home/run.sh"]

# Проверка жив ли контейнер CIS-DI-0006
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost || exit 1