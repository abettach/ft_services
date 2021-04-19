#!/bin/sh
rc-service telegraf start
rc-service nginx start
rc-service php-fpm7 start

sleep 2

while sleep 2;
	do
		pgrep telegraf
		telegraf_status=$? 
		if [ $telegraf_status -ne 0 ]; then
			echo "Telegraf service is not running ..."
			exit 1
		fi
		pgrep nginx
		nginx_status=$?
		if [ $nginx_status -ne 0 ]; then
			echo "Nginx service is not running ..."
			exit 1
		fi
		pgrep php 
		php_status=$?
		if [ $php_status -ne 0 ]; then
			echo "Php service is not running ..."
			exit 1
		fi

	done
exit