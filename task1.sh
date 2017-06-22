
command=$(java -jar /opt/client_job/XYZ.jar | awk '$0 ~ /INFO/ {print $0}')

if [ "$command" = "INFO:200" ]; then
  echo "Found a Tomcat!"
else
  echo "Server down"
  echo "Restart domain"
  #sh /home/glassfish/loop.sh
fi