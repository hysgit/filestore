#!/bin/bash

project=zhibao
deploy=${project}-deploy.tar.gz
hosts=(gw-1)

cd /opt/projects/${project}-api
git checkout master
git pull
mvn clean -DskipTests -Pproduct package

date=`date  +"%Y%m%d%H%M"`

for h in ${hosts[@]}; do
	ssh bobo@$h -t "
		cd /opt/projects
		mv ${deploy} ${deploy}.$date
	"
	scp ${project}-deploy/target/${deploy} bobo@$h:/opt/projects/
	ssh bobo@$h -t "
		source /etc/profile
		cd /opt/jetty/${project}-api
        ./stop.sh
		./start.sh
	"
done

cd -
