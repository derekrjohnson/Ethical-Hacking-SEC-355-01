#!/bin/bash

networkPrefix=$1
dns=$2

for i in $(seq 1 254); do
  nslookup "$networkPrefix.$i" "$dns" | grep -v '** server' | sed '/^[[:space:]]*$/d'
done  
