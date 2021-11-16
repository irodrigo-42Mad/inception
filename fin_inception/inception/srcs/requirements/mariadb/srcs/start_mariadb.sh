rc-service mariadb restart 

sleep 15

mysql -e "CREATE DATABASE $MYDB_NAME;"
mysql -e "CREATE USER '$MYDB_ROOT'@'%' IDENTIFIED BY '$MYDB_PASS';"
mysql -e "CREATE USER '$MYDB_USER'@'%' IDENTIFIED BY '$MYDB_PASS';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYDB_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"