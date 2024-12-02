truncate table lefttable;
INSERT INTO lefttable(lefttable.value)
SELECT tableau.leftColone FROM tableau ORDER BY tableau.leftColone;

TRUNCATE table rightable;
INSERT INTO rightable(rightable.value)
SELECT tableau.rightColone FROM tableau ORDER BY tableau.rightColone;

SELECT SUM(ABS(l.value-r.value)) FROM rightable r
inner join lefttable l on l.index_fk = r.index_fk