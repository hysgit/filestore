#!/bin/bash

project=zhibao-wechat
hosts=(pre-1)

cd /opt/projects/${project}
#git checkout master
#git pull
#mvn clean -DskipTests -Ptest package

date=`date  +"%Y%m%d%H%M"`

for h in ${hosts[@]}; do
	ssh admin@$h -t "
		cd /opt/projects
		mv $project.war $project.war.$date
	"	
	scp target/$project.war admin@$h:/opt/projects/
	ssh admin@$h -t "
		source /etc/profile
		cd /opt/jetty/$project
        ./stop.sh
		./start.sh
	"
done

cd -
