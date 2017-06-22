PID=$(ps -ef | grep glassfish3 | awk '$8 ~ /java/ {print $2} END {print tot }');
 
for line in $PID; do
   kill -9 "$line"
   echo "killing process:"$line; 
done
asadmin start-domain && asadmin  start-local-instance --node node1 --sync normal inst1
