#!/bin/bash

find . -name '*.py' -not -name 'test.py' -type f -print0 | while IFS= read -r -d '' file; do
  # make sure that we don't have unclosed queues + reseting any cpu masks
  rm /dev/mqueue/*
  pqos -R
  #killall -9 python
  
  # start collecting uArch exploration for the targeted python script
  vtune -collect=uarch-exploration /PATH/TO/run_script.sh "$(basename "$file")" 
  
  # exporting the collected results to a .csv file
  vtune -report summary -r OUTPUT-DIR -report-output = "$(basename -s .py "$file")".csv -format=csv -csv-delimiter=comma –q 
done
