rc-service telegraf start
cd /grafana
cd bin
./grafana-server

while true;
    do
        sleep 2
done
exit 0