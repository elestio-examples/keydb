#set env vars
set -o allexport; source .env; set +o allexport;

#wait until the server is ready
echo "Waiting for software to be ready ..."
sleep 30s;

   echo "redis-cli -h ${DOMAIN} -p 23647 -a ${SOFTWARE_PASSWORD}" > ./cli.sh
   echo "redis-cli -h ${DOMAIN} -p 23647 -a ${SOFTWARE_PASSWORD} save" > ./save.sh
   chmod +x ./cli.sh;
   chmod +x ./save.sh;

sleep 10s;

curl --header "Content-Type: application/json" --request POST --data '{ "name": "localRedis", "connectionType": "STANDALONE", "host": "172.17.0.1","port": 23647,"password": "'${SOFTWARE_PASSWORD}'"}' http://172.17.0.1:8001/api/instance/


sleep 25s;
docker-compose down
sudo apt-get install openssl -y
openssl genrsa -out ./data/redis.key 2048
openssl req -new -key ./data/redis.key -out ./data/redis.csr -subj "/CN=${DOMAIN}"
openssl x509 -req -days 3650 -in ./data/redis.csr -signkey ./data/redis.key -out ./data/redis.crt
cp ./data/redis.crt ./data/ca.crt 
sleep 5s;
sed -i 's/#--tls/--tls/' docker-compose.yml
docker-compose up -d;