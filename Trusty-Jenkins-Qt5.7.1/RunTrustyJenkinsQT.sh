#! /bin/bash

docker rm -f Jenkins-QT

echo "Restore Jenkins-QT Volume"
docker run -v ${PWD}/VarJenkins:/volume -v ${PWD}/Backup:/backup --rm kristant/volume-backup restore jenkins > /dev/null
docker run -d -p 8080:8080 -p 50000:50000 --name Jenkins-QT -v ${PWD}/VarJenkins:/var/jenkins kristant/trusty-jenkins-qt:5.7.1 > /dev/null
