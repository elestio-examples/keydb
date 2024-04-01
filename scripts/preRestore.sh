#stop the docker-compose stack before files are restored
docker-compose down;
mv ./app/data/dump.rdb ./app/data/dump.rdb.old;