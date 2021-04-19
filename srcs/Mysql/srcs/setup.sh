rc-service telegraf start
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
sed -i "s/skip-networking/# skip-networking/g" /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start

while sleep 2;
	do
		pgrep telegraf
		telegraf_status=$? 
		if [ $telegraf_status  -ne 0 ]; then
			echo "Telegraf service is not running ..."
			exit 1
		fi
		pgrep mysql
		mariadb_status=$?
		if [ $mariadb_status -ne 0 ]; then
			echo "Mariadb service is not running ..."
			exit 1
		fi

	done
exit