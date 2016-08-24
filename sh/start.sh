#!/bin/bash

branch=$1
if [ ! $1 ]; then
    branch=dev
fi

port=8091

# build
git pull
git checkout $branch
git pull
mvn clean

# stop jetty
oldjetty=( $(lsof -i:$port | grep 'java' | awk '{print $2}') )
opid=0
for i in ${oldjetty[@]}; do
    if [ $i -gt 0 ]; then
        kill -9 $i
        echo "jetty has been stopped($i)..."
        opid=$i
        break
    fi
done

# start jetty
nohup mvn -DskipTests -Djetty.http.port=$port jetty:run &

sleep 5s

while [ 1 ] 
do
    jetty=( $(lsof -i:$port | grep 'java' | awk '{print $2}') )
    for i in ${jetty[@]}; do
        if [ $i -gt 0  -a $i -ne $opid ]; then
            echo "jetty has been started($i)..."
            break 2
        fi
        sleep 2s
    done
done
