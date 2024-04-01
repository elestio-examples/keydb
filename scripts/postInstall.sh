#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 30s;

   echo "redis-cli -h ${DOMAIN} -p 23647 -a ${SOFTWARE_PASSWORD}" > ./app/cli.sh
   echo "redis-cli -h ${DOMAIN} -p 23647 -a ${SOFTWARE_PASSWORD} save" > ./app/save.sh
   chmod +x ./app/cli.sh;
   chmod +x ./app/save.sh;

sleep 10s;

curl --header "Content-Type: application/json" --request POST --data '{ "name": "localRedis", "connectionType": "STANDALONE", "host": "172.17.0.1","port": 23647,"password": "'${SOFTWARE_PASSWORD}'"}' http://172.17.0.1:8001/api/instance/