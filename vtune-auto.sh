#!/bin/bash


#find . -name '*.py' -not -name 'test.py' -type f -print0 | while IFS= read -r -d '' file; do
  rm /dev/mqueue/*
  pqos -R
  killall -9 python
  vtune -collect=uarch-exploration  /home/a972m888/Desktop/dmx/dmx-kernel-eval/scripts/run_script.sh multiple_runs_3gzip_2aes.py
  #echo "$(basename "$file")"
#done
