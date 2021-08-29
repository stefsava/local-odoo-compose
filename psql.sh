select character in $(ls volumes/odoo/filestore)
do
    docker-compose exec postgres psql -U odoo -d $character
    exit
done

