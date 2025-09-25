-- SELECT all active connections to database --
SELECT pid, usename, datname, application_name, client_addr
FROM pg_stat_activity
WHERE datname = 'BFSI';

-- CLOSE all connections to this database --
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'test_db';

-- DROP Database --
DROP DATABASE BFSI;
