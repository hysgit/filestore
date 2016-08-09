#!/bin/bash

project=study
deploy=${project}-deploy.tar.gz
hosts=(gw-1)

cd /home/hy/workspace/wrksp5/$project
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
		cd /opt/jetty/$project
        ./stop.sh
		./start.sh
	"
done

cd -
