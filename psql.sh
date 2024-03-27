select database in $(docker-compose exec postgres psql -U postgres -c "copy(SELECT datname FROM pg_database where datname NOT like 'template%' AND NOT datname = CURRENT_USER) TO STDOUT WITH CSV;")
do
  docker-compose exec postgres psql -U odoo -d $database
  exit
done

