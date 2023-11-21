/* Checking for null values */ 
SELECT * FROM Amazon WHERE c7 IS NULL OR c6 IS NULL OR c5 is NULL OR c4 is NULL OR c3 IS NULL OR c2 IS NULL OR c1 IS NULL;
SELECT * FROM Apple WHERE c7 IS NULL OR c6 IS NULL OR c5 is NULL OR c4 is NULL OR c3 IS NULL OR c2 IS NULL OR c1 IS NULL;
SELECT * FROM Google WHERE c7 IS NULL OR c6 IS NULL OR c5 is NULL OR c4 is NULL OR c3 IS NULL OR c2 IS NULL OR c1 IS NULL;
SELECT * FROM Microsoft WHERE c7 IS NULL OR c6 IS NULL OR c5 is NULL OR c4 is NULL OR c3 IS NULL OR c2 IS NULL OR c1 IS NULL;
SELECT * FROM Netflix WHERE c7 IS NULL OR c6 IS NULL OR c5 is NULL OR c4 is NULL OR c3 IS NULL OR c2 IS NULL OR c1 IS NULL;

/* Adding a column to each table to specify the company name */ 
ALTER TABLE Amazon ADD COLUMN Company VARCHAR(255);
UPDATE Amazon SET Company = 'Amazon';
SELECT * FROM Amazon;

ALTER TABLE Apple ADD COLUMN Company VARCHAR(255);
UPDATE Apple SET Company = 'Apple';
SELECT * FROM Apple;

ALTER TABLE Google ADD COLUMN Company VARCHAR(255);
UPDATE Google SET Company = 'Google';
SELECT * FROM Google;

ALTER TABLE Microsoft ADD COLUMN Company VARCHAR(255);
UPDATE Microsoft SET Company = 'Microsoft';
SELECT * FROM Microsoft;

ALTER TABLE Netflix ADD COLUMN Company VARCHAR(255);
UPDATE Netflix SET Company = 'Netflix';
SELECT * FROM Netflix;

/* Extract month and year from date and deleting first row */ 
ALTER TABLE Apple ADD COLUMN month INT;
ALTER TABLE Apple ADD COLUMN year INT;
UPDATE Apple SET month = CAST(SUBSTRING(c7, 6, 2) AS INTEGER), year = CAST(SUBSTRING(c7, 1, 4) AS INTEGER);
ALTER TABLE Apple DROP COLUMN c7;
DELETE FROM Apple WHERE month = 0;
SELECT * FROM Apple;

ALTER TABLE Amazon ADD COLUMN month INT;
ALTER TABLE Amazon ADD COLUMN year INT;
UPDATE Amazon SET month = CAST(SUBSTRING(c7, 6, 2) AS INTEGER), year = CAST(SUBSTRING(c7, 1, 4) AS INTEGER);
ALTER TABLE Amazon DROP COLUMN c7;
DELETE FROM Amazon WHERE month = 0;
SELECT * FROM Amazon;

ALTER TABLE Google ADD COLUMN month INT;
ALTER TABLE Google ADD COLUMN year INT;
UPDATE Google SET month = CAST(SUBSTRING(c7, 6, 2) AS INTEGER), year = CAST(SUBSTRING(c7, 1, 4) AS INTEGER);
ALTER TABLE Google DROP COLUMN c7;
DELETE FROM Google WHERE month = 0;
SELECT * FROM Google;

ALTER TABLE Microsoft ADD COLUMN month INT;
ALTER TABLE Microsoft ADD COLUMN year INT;
UPDATE Microsoft SET month = CAST(SUBSTRING(c7, 6, 2) AS INTEGER), year = CAST(SUBSTRING(c7, 1, 4) AS INTEGER);
ALTER TABLE Microsoft DROP COLUMN c7;
DELETE FROM Microsoft WHERE month = 0;
SELECT * FROM Microsoft;

ALTER TABLE Netflix ADD COLUMN month INT;
ALTER TABLE Netflix ADD COLUMN year INT;
UPDATE Netflix SET month = CAST(SUBSTRING(c7, 6, 2) AS INTEGER), year = CAST(SUBSTRING(c7, 1, 4) AS INTEGER);
ALTER TABLE Netflix DROP COLUMN c7;
DELETE FROM Netflix WHERE month = 0;
SELECT * FROM Netflix;

/* Merging the tables together */ 
CREATE TABLE MAANG (
    c1 FLOAT,
    c2 FLOAT,
    c3 FLOAT,
    c4 FLOAT,
    c5 FLOAT,
    c6 INTEGER,
    company TEXT,
    month INTEGER,
    year INTEGER
);

INSERT INTO MAANG
SELECT c1, c2, c3, c4, c5, c6, company, month, year FROM Amazon
UNION ALL
SELECT c1, c2, c3, c4, c5, c6, company, month, year FROM Apple
UNION ALL
SELECT c1, c2, c3, c4, c5, c6, company, month, year FROM Google
UNION ALL
SELECT c1, c2, c3, c4, c5, c6, company, month, year FROM Microsoft
UNION ALL
SELECT c1, c2, c3, c4, c5, c6, company, month, year FROM Netflix;

Select * FROM MAANG;
