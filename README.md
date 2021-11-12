# API FAST - REPORTS#

## Build on local instance

`docker build -f Dockerfile -t backend-report --no-cache .`

```bash
cat > env.txt << EOF
ENVIRONMENT=production
APP_NAME=backend-report
EOF
```

`docker run -di -p 8080:8080 -v $(pwd)/src/:/opt/disk_balancer --env-file ./env.txt --name backend-disk-balancer -d backend-disk-balancer`

`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' backend-disk-balancer`

`docker exec -ti backend-disk-balancer bash`
