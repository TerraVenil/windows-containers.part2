SELECT * FROM V$INSTANCE;

DROP TABLE TestTable;

SELECT * FROM TestTable;

CREATE TABLE TestTable (test_id number(10) NOT NULL);
INSERT INTO TestTable (test_id) VALUES (1);