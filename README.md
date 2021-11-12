# API FAST - REPORTS#

## Build on local instance

`docker build -f Dockerfile -t backend-report --no-cache .`

```bash
cat > env.txt << EOF
ENVIRONMENT=production
APP_NAME=backend-report
EOF
```

`docker run -di -p 8080:8080 -v $(pwd)/src/:/opt/report --env-file ./env.txt --name backend-report -d backend-report`

`docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' backend-report`

`docker exec -ti backend-disk-balancer bash`
