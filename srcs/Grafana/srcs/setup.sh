rc-service telegraf start
sleep 2

cd /grafana/bin && ./grafana-server
sleep 2

while sleep 2;
	do
		pgrep telegraf
		telegraf_status=$?
		if [ $telegraf_status != 0 ]; then
			echo "Telegraf service is not running ..."
			exit 1
		fi
		pgrep grafana-server
		grafana_status=$?
		if [ $grafana_status != 0 ]; then
			echo "Grafana server is not running ..."
			exit 1
		fi

	done
exit