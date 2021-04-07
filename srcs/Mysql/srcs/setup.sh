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

while true;
do
        sleep 2
done