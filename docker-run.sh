#!/bin/bash

case $1 in
up)
echo starting...
docker run \
  --name hello-world-nginx \
  -v `pwd`/html:/usr/share/nginx/html \
  -v `pwd`/assets:/usr/share/nginx/assets \
  -v `pwd`/default.conf:/etc/nginx/conf.d/default.conf:ro \
  -p 80:80 -d nginx
;;
down)
echo stoping...
docker stop hello-world-nginx
echo removing...
docker rm hello-world-nginx
;;
logs)
docker logs -f hello-world-nginx
;;
*)
echo "Usage: ./docker-run.sh up | down | logs"
;;
esac