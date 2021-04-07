#!/bin/sh
rc-service telegraf start
rc-service nginx start
sleep 2

while true;
do
        sleep 2
done

exit 0