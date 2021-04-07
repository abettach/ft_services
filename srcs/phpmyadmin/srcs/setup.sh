rc-service nginx start
rc-service telegraf start
rc-service php-fpm7 start

sleep 2

while true;
        do
                sleep 2
done
exit 0