FROM 192.168.24.1:8787/tripleostein/centos-binary-mariadb:5751fc7dd0cf573d8c60b3de597116b515e0fd7d_c992c9c0

USER root

COPY ../pacemaker.sh /tmp/
RUN ./tmp/pacemaker.sh

USER "mysql"
