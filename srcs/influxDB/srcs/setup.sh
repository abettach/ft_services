rc-service telegraf start
rc-service influxdb start

while true;
    do
        sleep 2
done
exit 0