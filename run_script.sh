#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <python_script>"
  exit 1
fi
# run the python script with the given argument from the outside world
# rdtset limits the memory bandwith to 80% of its actual bandwidth, limiting the llc ways to 8 ways, this applies to 0-15 cores.  -c 0-15 sets the affinity and make the python script to run only on these cores 
sudo rdtset -t 'mba=80;l3=0xff;cpu=0-15' -c 0-15 python "$1"

