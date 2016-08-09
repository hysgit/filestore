#!/bin/bash

project=xzaccount
deploy=${project}-deploy.tar.gz
hosts=(pre-1)

cd /opt/projects/$project
git checkout master
git pull
mvn clean -DskipTests -Ptest package

date=`date  +"%Y%m%d%H%M"`

for h in ${hosts[@]}; do
	ssh admin@$h -t "
		cd /opt/projects
		mv ${deploy} ${deploy}.$date
	"
	scp ${project}-deploy/target/${deploy} admin@$h:/opt/projects/
	ssh admin@$h -t "
		source /etc/profile
		cd /opt/jetty/$project
        ./stop.sh
		./start.sh
	"
done

cd -
