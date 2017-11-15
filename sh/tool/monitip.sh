#!/bin/bash
echo "脚本启动!"
ip=`nslookup officevpn.91ganlu.com | tail -n 2 | head -n 1 | awk '{print $2}'`
i=1
while((i<=100))
do
    ip2=`nslookup officevpn.91ganlu.com | tail -n 2 | head -n 1 | awk '{print $2}'`
    echo "${ip2}"
    if [ "${ip}" != "${ip2}" ];then
        echo $(date +%Y%m%d%H%M)
        docker restart nginx-gw-v0829-withcache
        echo "ip地址发生变化,重启nginx"
        echo "原ip:${ip}"
        echo "新IP:${ip2}"
        echo ""
        ip=${ip2}
    fi
    sleep 3
done
