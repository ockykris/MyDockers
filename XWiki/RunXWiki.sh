#! /bin/bash

docker rm -f Mysql-XWiki > /dev/null
docker rm -f XWiki > /dev/null
docker network rm xwiki-nw > /dev/null
docker network create -d bridge xwiki-nw > /dev/null

echo "Restore MySQL Volume"
docker run -v ${PWD}/mysql:/volume -v ${PWD}/Backup:/backup --rm loomchild/volume-backup restore mysql > /dev/null
docker run --net=xwiki-nw -d --name Mysql-XWiki -v ${PWD}/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=xwiki -e MYSQL_USER=xwiki -e MYSQL_PASSWORD=xwiki -e MYSQL_DATABASE=xwiki mysql:5.7 --character-set-server=utf8 --collation-server=utf8_bin --explicit-defaults-for-timestamp=1 > /dev/null

echo "Restore XWiki Volume"
docker run -v ${PWD}/xwiki:/volume -v ${PWD}/Backup:/backup --rm loomchild/volume-backup restore xwiki > /dev/null
docker run --net=xwiki-nw -d --name XWiki -p 8081:8080 -v ${PWD}/xwiki:/usr/local/xwiki -e DB_USER=xwiki -e DB_PASSWORD=xwiki -e DB_DATABASE=xwiki -e DB_HOST=Mysql-XWiki xwiki:mysql-tomcat > /dev/null

