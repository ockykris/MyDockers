#! /bin/bash

docker rm -f Jenkins-QT
docker run -d -p 8080:8080 -p 50000:50000 --name Jenkins-QT -v ${PWD}/VarJenkins:/var/jenkins kristant/trusty-jenkins-qt
