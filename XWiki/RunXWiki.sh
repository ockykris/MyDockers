#! /bin/bash

docker network rm -f xwiki-nw
docker rm -f Mysql-XWiki
docker rm -f XWiki
docker network create -d bridge xwiki-nw
docker run --net=xwiki-nw -d --name Mysql-XWiki -v ${PWD}/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=xwiki -e MYSQL_USER=xwiki -e MYSQL_PASSWORD=xwiki -e MYSQL_DATABASE=xwiki mysql:5.7 --character-set-server=utf8 --collation-server=utf8_bin --explicit-defaults-for-timestamp=1
docker run --net=xwiki-nw -d --name XWiki -p 8888:8080 -v ${PWD}/xwiki:/usr/local/xwiki -e DB_USER=xwiki -e DB_PASSWORD=xwiki -e DB_DATABASE=xwiki -e DB_HOST=Mysql-XWiki xwiki:mysql-tomcat

