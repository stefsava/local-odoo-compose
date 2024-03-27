# Docker compose script for local odoo development

We use https://github.com/Elico-Corp/odoo-docker.

Please see https://github.com/Elico-Corp/odoo-docker for more info.

## Usage

For create your custom local env clone this repository in a new local directory
and config .env file like .env.sample suggests.

Note that docker compose names docker containers based on the name of the directory that contains the docker-compose.yml file,
so cloning this repository many times with different directory names you can work on many different projects.

```
git clone https://github.com/stefsava/local-odoo-compose -o upstream my_local_odoo_project
```

## remove all volumes (if exists) and start or restart the project

```bash
./reset.sh
```

