CREATE USER 'tinterface'@'localhost' IDENTIFIED BY '***';

GRANT   SELECT ,
        INSERT ,
        UPDATE ,
        DELETE
ON * . * TO 'tinterface'@'localhost'
IDENTIFIED BY '***' WITH
    MAX_QUERIES_PER_HOUR 0
    MAX_CONNECTIONS_PER_HOUR 0
    MAX_UPDATES_PER_HOUR 0
    MAX_USER_CONNECTIONS 0 ;