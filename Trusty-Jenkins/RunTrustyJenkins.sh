#! /bin/bash

docker rm -f Master-Jenkins
docker run -d -p 8080:8080 -p 50000:50000 --name Master-Jenkins -v ${PWD}/VarJenkins:/var/jenkins kristant/trusty-jenkins
