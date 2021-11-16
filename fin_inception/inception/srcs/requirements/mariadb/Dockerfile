FROM alpine:3.13
LABEL version="1.0"

#install mariadb maria db_client and openrc, update components...
RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-common
RUN apk add --no-cache openrc
#background openrc, config mariadb and start service
RUN openrc && touch /run/openrc/softlevel && /etc/init.d/mariadb setup && /etc/init.d/mariadb start
RUN sed -e '/skip-networking/s/^/#/g' -i /etc/my.cnf.d/mariadb-server.cnf
COPY srcs/start_mariadb.sh .
RUN chmod -R 777 start_mariadb.sh

CMD ./start_mariadb.sh && mysqld_safe