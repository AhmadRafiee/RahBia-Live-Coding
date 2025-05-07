# Setup voting app project with Docker

**Step 01:** create docker network
```bash
docker network ls | grep web_net || docker network create web_net
docker network ls | grep app_net || docker network create app_net
```

**Step 02:** build voting app images
```bash
[ -d /opt/services ] || mkdir /opt/services
[ -d /opt/services/monorepo-voting-app ] || git clone git@git.rahbia.mecan.ir:devops/monorepo-voting-app.git
docker login https://${image_registry}
docker compose -f image-compose.yml build
docker compose -f image-compose.yml push
```

**Step 03:** create project directory and clone or pull voting git project
```bash
cd /opt/services/monorepo-voting-app
docker compose pull
docker compose config
docker compose up -d
docker compose ps
```

# Generate new certificate using Certbot
certbot certonly --manual --preferred-challenges dns -d app.mecan.ir -d *.app.mecan.ir