# Updating packages to secure last vertion
apt-get update

# Installing tcl, we will need it
apt-get install tcl8.5 -y


# Download Redis from tarball
wget http://download.redis.io/releases/redis-stable.tar.gz -P /tmp

# Unzipping
tar xzf /tmp/redis-stable.tar.gz --directory /tmp

# Installing Redis
(cd /tmp/redis-stable && exec make)
(cd /tmp/redis-stable/utils/ && exec sh install_server.sh)
(cd /tmp/redis-stable/ && exec make test)