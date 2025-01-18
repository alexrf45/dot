#!/bin/bash

if [ ! $1 ]; then
  echo "usage: $0 <cityname>"
  exit
fi
/usr/bin/curl -S wttr.in/$1
