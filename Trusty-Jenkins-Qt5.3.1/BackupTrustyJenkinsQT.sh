#! /bin/bash

echo "Backup Volume"
docker run -v ${PWD}/VarJenkins:/volume -v ${PWD}/Backup:/backup --rm kristant/volume-backup backup jenkins
docker stop Jenkins-QT
