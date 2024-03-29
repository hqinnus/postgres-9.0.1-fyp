/* $PostgreSQL: pgsql/contrib/pg_stat_statements/pg_stat_statements.sql.in,v 1.2 2010/01/08 00:38:19 itagaki Exp $ */

-- Adjust this setting to control where the objects get created.
SET search_path = public;

-- Register functions.
CREATE FUNCTION pg_stat_statements_reset()
RETURNS void
AS '$libdir/pg_stat_statements'
LANGUAGE C;

CREATE FUNCTION pg_stat_statements(
    OUT userid oid,
    OUT dbid oid,
    OUT query text,
    OUT calls int8,
    OUT total_time float8,
    OUT rows int8,
    OUT shared_blks_hit int8,
    OUT shared_blks_read int8,
    OUT shared_blks_written int8,
    OUT local_blks_hit int8,
    OUT local_blks_read int8,
    OUT local_blks_written int8,
    OUT temp_blks_read int8,
    OUT temp_blks_written int8
)
RETURNS SETOF record
AS '$libdir/pg_stat_statements'
LANGUAGE C;

-- Register a view on the function for ease of use.
CREATE VIEW pg_stat_statements AS
  SELECT * FROM pg_stat_statements();

GRANT SELECT ON pg_stat_statements TO PUBLIC;

-- Don't want this to be available to non-superusers.
REVOKE ALL ON FUNCTION pg_stat_statements_reset() FROM PUBLIC;
