#! /bin/bash

echo "Backup MySQL"
docker run -v ${PWD}/mysql:/volume -v ${PWD}/Backup:/backup --rm loomchild/volume-backup backup mysql

echo "Backup XWiki"
docker run -v ${PWD}/xwiki:/volume -v ${PWD}/Backup:/backup --rm loomchild/volume-backup backup xwiki

docker stop XWiki
docker stop Mysql-XWiki
