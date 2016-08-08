#!/bin/bash
if [ "x$DOCKERIMAGE" == "x" ]
    then
        DOCKERIMAGE=bgruening/galaxy-stable:16.07
fi
echo "Using [${DOCKERIMAGE}]"

docker stop catdockertest
docker rm catdockertest
docker run --privileged=true -v $PWD/setup-galaxy.sh:/galaxy-central/setup-galaxy.sh -v $PWD/job_conf.xml.local_docker:/etc/galaxy/job_conf.xml -d --name catdockertest -e "NONUSE=condor,nodejs,proftpd" -p 19002:9002 -p 18080:80 ${DOCKERIMAGE} /galaxy-central/setup-galaxy.sh

#
echo "docker logs -f catdockertest"
