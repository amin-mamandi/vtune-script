#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <python_script>"
  exit 1
fi

sudo rdtset -t 'mba=80;l3=0xff;cpu=0-15' -c 0-15 python "$1"

