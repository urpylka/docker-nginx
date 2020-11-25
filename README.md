# docker-nginx

## Quick start

```bash
docker run \
    --name nginx \
    -d \
    -p 80:80 \
    -p 8080:8080 \
    -v "$(pwd)/nginx.conf":/etc/nginx/conf.d/default.conf \
    --log-opt "max-size=100m" \
    -e "HTTP_USER=foo" \
    -e "HTTP_PASS=bar" \
    --restart always \
    --network=bridge \
    urpylka/nginx
```
