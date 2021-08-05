sudo su root
systemctl stop confluent-kafka
systemctl stop confluent-zookeeper
rm -rf /var/lib/kafka/*
rm -rf /var/lib/zookeeper/*
sed -i -e 's/log.retention.hours=168/log.retention.hours=3/g' /etc/kafka/server.properties
systemctl start confluent-zookeeper
systemctl start confluent-kafka
#Use below commands to validate the logs of process
#journalctl -f -u confluent-kafka
#journalctl -f -u confluent-zookeeper
