PID=$(ps -ef | grep glassfish3 | awk '$0 ~ /java/ {print $2}');
for line in $PID; do
  kill -9 "$line"
  echo "killing process:"$line;
done
sleep 4

DOMAINS=$(asadmin list-domains | awk '$0 ~ /not running/ {print $1}');
for dmn in $DOMAINS; do
  asadmin start-domain "$dmn"
  echo "started domain:"$dmn;
done
 sleep 4

CLUSTERS=$(asadmin list-clusters | awk '$0 ~ /not running/ {print $1}');
for clstr in $CLUSTERS; do
  asadmin start-cluster "$clstr"
  echo "started cluster:"$clstr
done
