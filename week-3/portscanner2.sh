#!/bin/bash

networkPrefix=$1
port=$2

if [ -z $networkPrefix ]; then
  echo "Please specify a host file"
  exit 1
fi

if [ -z $port ]; then
  echo "Please specify a port file"
  exit 1
fi

echo "ip,port"
for i in $(seq 1 254); do
  timeout .1 bash -c "echo >/dev/tcp/$networkPrefix.$i/$port" 2>/dev/null &&
    echo "$networkPrefix.$i,$port"
done
