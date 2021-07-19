docker stop odoo_sandbox_odoo_1 odoo_sandbox_postgres_1
docker rm odoo_sandbox_odoo_1 odoo_sandbox_postgres_1
rm -r volumes 

mkdir -p ./volumes/{postgres,odoo/filestore,odoo/sessions,odoo/ssh}
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
