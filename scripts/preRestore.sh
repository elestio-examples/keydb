#stop the docker-compose stack before files are restored
docker-compose down;
mv ./data/dump.rdb ./data/dump.rdb.old;