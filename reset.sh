docker stop odoo_sandbox_odoo_1 odoo_sandbox_postgres_1
docker rm odoo_sandbox_odoo_1 odoo_sandbox_postgres_1
rm -rf ./volumes/{postgres,odoo/filestore,odoo/sessions} 

mkdir -p ./volumes/{postgres,odoo/addons,odoo/filestore,odoo/sessions,odoo/ssh}
cp init/oca_dependencies.txt volumes/odoo/addons

docker-compose up -d postgres

echo "Wait 10 secs for postgres service"
sleep 10
docker-compose logs

echo "Wait 10 secs for postgres service"
sleep 10
docker-compose logs

echo "
  CREATE user odoo WITH password 'strong_pg_superuser_password';
  ALTER user odoo WITH createdb;
" | docker-compose exec -T postgres psql -U postgres

docker-compose up -d odoo
open http://localhost:8069
docker-compose logs -f

