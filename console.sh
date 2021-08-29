select character in $(ls volumes/odoo/filestore)
do
  docker-compose exec odoo odoo/odoo-bin shell -d  $character --db_host postgres --db_password strong_pg_superuser_password -c /opt/odoo/etc/odoo.conf
  exit
done

