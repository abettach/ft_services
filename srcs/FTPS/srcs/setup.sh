rc-service telegraf start
sleep 2
rc-service vsftpd start
sleep 2

while sleep 2;
	do
        pgrep telegraf
		telegraf_status=$?
		if [ $telegraf_status != 0 ]; then
			echo "Telegraf service is not running ..."
			exit 1
		fi
		pgrep vsftpd
		vsftpd=$?
		if [ $vsftpd_status != 0 ]; then
			echo "Influxdb service is not running ..."
			exit 1
		fi

	done
exit