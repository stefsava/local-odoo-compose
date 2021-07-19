# Docker compose script for local odoo development

We use https://github.com/Elico-Corp/odoo-docker.

Please see https://github.com/Elico-Corp/odoo-docker for more info.

## remove all volumes (if exists) and start or restart the project

```bash
./reset.sh
```

## start

```bash
docker-compose down
docker-compose up
docker-compose exec postgres psql -U postgres
```

## TODO

change postgres port to avoid conflict

