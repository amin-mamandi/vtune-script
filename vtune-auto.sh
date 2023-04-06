#!/bin/bash

#declare -a StringArray=("concat_cast_flatten_aes" "mel_scale" "image_resize"
 # "reshape_casting" "concat_cast_flatten_gzip" )

declare -a StringArray=("concat_cast_flatten_aes")
declare -a Core=("10" "0-1" "0-3" "0-7" "0-15")

for dm in "${StringArray[@]}"; do

for core in "${Core[@]}"; do
        for iter in 1 2 3 4
        do
                #for i in 2 3 4 5 8 10 12 14
                #do
                if [ "$core" = "10" ]; then
                        sudo pqos -R
                        killall -9 python
                        killall -9 python3
                        rm /dev/mqueue/*
                        vtune -collect=uarch-exploration  -r /home/a972m888/Desktop/dmx/dmx-kernel-eval/$dm-$iter-c-$core /home/a972m888/Desktop/dmx/dmx-kernel-eval/run_script.sh $dm $core 1
                        vtune -report summary -r /home/a972m888/Desktop/dmx/dmx-kernel-eval/$dm-$iter-c-$core -report-output=$dm-$iter-c-$core.csv -format=csv -csv-delimiter=comma –q
                elif [ "$core" = "0-1" ]; then
                        sudo pqos -R
                        killall -9 python
                        killall -9 python3
                        rm /dev/mqueue/*
                        vtune -collect=uarch-exploration  -r /home/a972m888/Desktop/dmx/dmx-kernel-eval/$dm-$iter-c-$core /home/a972m888/Desktop/dmx/dmx-kernel-eval/run_script.sh $dm $core 2
                        vtune -report summary -r /home/a972m888/Desktop/dmx/dmx-kernel-eval/$dm-$iter-c-$core -report-output=$dm-$iter-c-$core.csv -format=csv -csv-delimiter=comma –q
                elif [ "$core" = "0-3" ]; then
                        sudo pqos -R
                        killall -9 python
                        killall -9 python3
                        rm /dev/mqueue/*
                        vtune -collect=uarch-exploration  -r /home/a972m888/Desktop/dmx/dmx-kernel-eval/$dm-$iter-c-$core /home/a972m888/Desktop/dmx/dmx-kernel-eval/run_script.sh $dm $core 4
                        vtune -report summary -r /home/a972m888/Desktop/dmx/dmx-kernel-eval/$dm-$iter-c-$core -report-output=$dm-$iter-c-$core.csv -format=csv -csv-delimiter=comma –q
                elif [ "$core" = "0-7" ]; then
                        sudo pqos -R
                        killall -9 python
                        killall -9 python3
                        rm /dev/mqueue/*
                        vtune -collect=uarch-exploration  -r /home/a972m888/Desktop/dmx/dmx-kernel-eval/$dm-$iter-c-$core /home/a972m888/Desktop/dmx/dmx-kernel-eval/run_script.sh $dm $core 4
                        vtune -report summary -r /home/a972m888/Desktop/dmx/dmx-kernel-eval/$dm-$iter-c-$core -report-output=$dm-$iter-c-$core.csv -format=csv -csv-delimiter=comma –q
                elif [ "$core" = "0-15" ]; then
                        sudo pqos -R
                        killall -9 python
                        killall -9 python3
                        rm /dev/mqueue/*
                        vtune -collect=uarch-exploration  -r /home/a972m888/Desktop/dmx/dmx-kernel-eval/$dm-$iter-c-$core /home/a972m888/Desktop/dmx/dmx-kernel-eval/run_script.sh $dm $core 4
                        vtune -report summary -r /home/a972m888/Desktop/dmx/dmx-kernel-eval/$dm-$iter-c-$core -report-output=$dm-$iter-c-$core.csv -format=csv -csv-delimiter=comma –q
                fi


        done
done
done
