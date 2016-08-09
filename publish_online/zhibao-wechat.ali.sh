#!/bin/bash

project=zhibao-wechat
hosts=(gw-1)

cd /opt/projects/${project}
#git checkout master
#git pull
#mvn clean -DskipTests -Pproduct package

date=`date  +"%Y%m%d%H%M"`

for h in ${hosts[@]}; do
	ssh bobo@$h -t "
		cd /opt/projects
		mv $project.war $project.war.$date
	"	
	scp target/$project.war bobo@$h:/opt/projects/
	ssh bobo@$h -t "
		source /etc/profile
		cd /opt/jetty/$project
        ./stop.sh
		./start.sh
	"
done

cd -
