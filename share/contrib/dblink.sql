/* $PostgreSQL: pgsql/contrib/dblink/dblink.sql.in,v 1.19 2009/08/05 16:11:07 joe Exp $ */

-- Adjust this setting to control where the objects get created.
SET search_path = public;

-- dblink_connect now restricts non-superusers to password
-- authenticated connections
CREATE OR REPLACE FUNCTION dblink_connect (text)
RETURNS text
AS '$libdir/dblink','dblink_connect'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_connect (text, text)
RETURNS text
AS '$libdir/dblink','dblink_connect'
LANGUAGE C STRICT;

-- dblink_connect_u allows non-superusers to use
-- non-password authenticated connections, but initially
-- privileges are revoked from public
CREATE OR REPLACE FUNCTION dblink_connect_u (text)
RETURNS text
AS '$libdir/dblink','dblink_connect'
LANGUAGE C STRICT SECURITY DEFINER;

CREATE OR REPLACE FUNCTION dblink_connect_u (text, text)
RETURNS text
AS '$libdir/dblink','dblink_connect'
LANGUAGE C STRICT SECURITY DEFINER;

REVOKE ALL ON FUNCTION dblink_connect_u (text) FROM public;
REVOKE ALL ON FUNCTION dblink_connect_u (text, text) FROM public;

CREATE OR REPLACE FUNCTION dblink_disconnect ()
RETURNS text
AS '$libdir/dblink','dblink_disconnect'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_disconnect (text)
RETURNS text
AS '$libdir/dblink','dblink_disconnect'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_open (text, text)
RETURNS text
AS '$libdir/dblink','dblink_open'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_open (text, text, boolean)
RETURNS text
AS '$libdir/dblink','dblink_open'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_open (text, text, text)
RETURNS text
AS '$libdir/dblink','dblink_open'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_open (text, text, text, boolean)
RETURNS text
AS '$libdir/dblink','dblink_open'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_fetch (text, int)
RETURNS setof record
AS '$libdir/dblink','dblink_fetch'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_fetch (text, int, boolean)
RETURNS setof record
AS '$libdir/dblink','dblink_fetch'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_fetch (text, text, int)
RETURNS setof record
AS '$libdir/dblink','dblink_fetch'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_fetch (text, text, int, boolean)
RETURNS setof record
AS '$libdir/dblink','dblink_fetch'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_close (text)
RETURNS text
AS '$libdir/dblink','dblink_close'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_close (text, boolean)
RETURNS text
AS '$libdir/dblink','dblink_close'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_close (text, text)
RETURNS text
AS '$libdir/dblink','dblink_close'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_close (text, text, boolean)
RETURNS text
AS '$libdir/dblink','dblink_close'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink (text, text)
RETURNS setof record
AS '$libdir/dblink','dblink_record'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink (text, text, boolean)
RETURNS setof record
AS '$libdir/dblink','dblink_record'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink (text)
RETURNS setof record
AS '$libdir/dblink','dblink_record'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink (text, boolean)
RETURNS setof record
AS '$libdir/dblink','dblink_record'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_exec (text, text)
RETURNS text
AS '$libdir/dblink','dblink_exec'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_exec (text, text, boolean)
RETURNS text
AS '$libdir/dblink','dblink_exec'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_exec (text)
RETURNS text
AS '$libdir/dblink','dblink_exec'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_exec (text,boolean)
RETURNS text
AS '$libdir/dblink','dblink_exec'
LANGUAGE C STRICT;

CREATE TYPE dblink_pkey_results AS (position int, colname text);

CREATE OR REPLACE FUNCTION dblink_get_pkey (text)
RETURNS setof dblink_pkey_results
AS '$libdir/dblink','dblink_get_pkey'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_build_sql_insert (text, int2vector, int, _text, _text)
RETURNS text
AS '$libdir/dblink','dblink_build_sql_insert'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_build_sql_delete (text, int2vector, int, _text)
RETURNS text
AS '$libdir/dblink','dblink_build_sql_delete'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_build_sql_update (text, int2vector, int, _text, _text)
RETURNS text
AS '$libdir/dblink','dblink_build_sql_update'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_current_query ()
RETURNS text
AS '$libdir/dblink','dblink_current_query'
LANGUAGE C;

CREATE OR REPLACE FUNCTION dblink_send_query(text, text)
RETURNS int4
AS '$libdir/dblink', 'dblink_send_query'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_is_busy(text)
RETURNS int4
AS '$libdir/dblink', 'dblink_is_busy'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_get_result(text)
RETURNS SETOF record
AS '$libdir/dblink', 'dblink_get_result'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_get_result(text, bool)
RETURNS SETOF record
AS '$libdir/dblink', 'dblink_get_result'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_get_connections()
RETURNS text[]
AS '$libdir/dblink', 'dblink_get_connections'
LANGUAGE C;

CREATE OR REPLACE FUNCTION dblink_cancel_query(text)
RETURNS text
AS '$libdir/dblink', 'dblink_cancel_query'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_error_message(text)
RETURNS text
AS '$libdir/dblink', 'dblink_error_message'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_get_notify(
    OUT notify_name TEXT,
    OUT be_pid INT4,
    OUT extra TEXT
) 
RETURNS setof record
AS '$libdir/dblink', 'dblink_get_notify'
LANGUAGE C STRICT;

CREATE OR REPLACE FUNCTION dblink_get_notify(
    conname TEXT,
    OUT notify_name TEXT,
    OUT be_pid INT4,
    OUT extra TEXT
) 
RETURNS setof record
AS '$libdir/dblink', 'dblink_get_notify'
LANGUAGE C STRICT;
