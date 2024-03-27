#!/bin/bash
echo "
DO
\$do\$
BEGIN
   IF EXISTS (
      SELECT FROM pg_catalog.pg_roles
      WHERE  rolname = '$ODOO_DB_USER') THEN

      RAISE NOTICE 'Role "$ODOO_DB_USER" already exists. Skipping.';
   ELSE
      BEGIN   -- nested block
           CREATE user "$ODOO_DB_USER" WITH password '$ODOO_DB_PASSWORD';
           ALTER user "$ODOO_DB_USER" WITH createdb;
      EXCEPTION
         WHEN duplicate_object THEN
            RAISE NOTICE 'Role "$ODOO_DB_USER" was just created by a concurrent transaction. Skipping.';
      END;
   END IF;
END
\$do\$;
" | \
PGPASSWORD=$ODOO_DB_PASSWORD psql -h postgres -U postgres
