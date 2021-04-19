rc-service telegraf start
cd /grafana/bin && ./grafana-server

while sleep 2;
	do
		pgrep telegraf
		telegraf_status=$?
		if [ $telegraf_status -ne 0 ]; then
			echo "Telegraf service is not running ..."
			exit 1
		fi
		pgrep grafana-server
		grafana_status=$?
		if [ $grafana_status -ne 0 ]; then
			echo "Grafana server is not running ..."
			exit 1
		fi

	done
exit