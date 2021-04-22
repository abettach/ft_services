rc-service telegraf start
rc-service nginx start

while sleep 2;
	do
        pgrep telegraf
		telegraf_status=$?
		if [ $telegraf_status != 0 ]; then
			echo "Telegraf service is not running ..."
			exit 1
		fi
		pgrep nginx 
		nginx_status=$?
		if [ $nginx_status != 0 ]; then
			echo "Influxdb service is not running ..."
			exit 1
		fi

	done
exit