rc-service telegraf start
sleep 2

if [ ! -f "/var/lib/mysql/ib_buffer_pool" ]; then
	/etc/init.d/mariadb setup
	rc-service mariadb start
	echo "--------setup--------"
	echo "CREATE DATABASE wordpress;" | mysql -u root
	echo "CREATE USER 'abettach'@'%' IDENTIFIED BY 'abettach';" | mysql -u root
	echo "grant all privileges on *.* to 'abettach'@'%';" | mysql -u root
	echo "flush privileges;" | mysql -u root
	mysql -u root wordpress < wordpress.sql
	echo "-----------done----------"
	rc-service mariadb stop
fi
sleep 2

sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
sleep 2

rc-service mariadb start
sleep 2

while sleep 2;
	do
		pgrep telegraf
		telegraf_status=$? 
		if [ $telegraf_status != 0 ]; then
			echo "Telegraf service is not running ..."
			exit 1
		fi
		pgrep mysql
		mariadb_status=$?
		if [ $mariadb_status != 0 ]; then
			echo "Mariadb service is not running ..."
			exit 1
		fi

	done
exit