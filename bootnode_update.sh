#!/bin/bash
filename="./machines.txt"
while read line
do
    echo "$line"
    name=`echo $line | cut -d' ' -f1`
    ip=`echo $line | cut -d' ' -f2`
    echo "=> Updating machine: $name at $ip"
    ssh -o "StrictHostKeyChecking no" ubuntu@${ip} "hostname" < /dev/null
    ssh ubuntu@${ip} "sudo service poa-parity stop" < /dev/null
    scp ./bootnodes.txt ubuntu@${ip}:/home/ubuntu/bootnodes.txt
    ssh ubuntu@${ip} "sudo mv /home/ubuntu/bootnodes.txt /home/${name}/bootnodes.txt" < /dev/null
    ssh ubuntu@${ip} "sudo service poa-parity start" < /dev/null
done < $filename