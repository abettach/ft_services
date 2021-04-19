rc-service influxdb start
rc-service telegraf start

while true;
	do
        # pgrep telegraf
		# telegraf_status=$?
		# if [ $telegraf_status -ne 0 ]; then
		# 	echo "Telegraf service is not running ..."
		# 	exit 1
		# fi
		# pgrep influxdb
		# influxdb_status=$?
		# if [ $influxdb_status -ne 0 ]; then
		# 	echo "Influxdb service is not running ..."
		# 	exit 1
		# fi
		sleep 2
	done