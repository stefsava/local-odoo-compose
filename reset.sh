set -o allexport
source .env set
set +o allexport

docker-compose rm -fs

until test -z $(docker-compose ps -q)
do
  echo waiting for docker compose stop and remove containers ...
  sleep 1
done

rm -rf ./volumes/{postgres,odoo/filestore,odoo/sessions}

mkdir -p ./volumes/{postgres,odoo/addons,odoo/filestore,odoo/sessions,odoo/ssh,odoo/scripts}
cp init/oca_dependencies.txt volumes/odoo/addons
cp init/startup.sh volumes/odoo/scripts/

docker-compose up -d
open http://localhost:$ODOO_PORT
docker-compose logs -f
