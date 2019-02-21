# Updating packages to secure last version
apt-get update

# Installing MySQL server
apt-get install mysql-server -y

# Opening mysql secure installation iterative CLI
mysql_secure_installation

# Testing mysql installagion
systemctl status mysql.service