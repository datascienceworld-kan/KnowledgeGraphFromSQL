-- terminate all connections --
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'test_db';

-- drop database --
DROP DATABASE test_db;

-- create database --
CREATE DATABASE test_db;
