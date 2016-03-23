select SID, SNAME from Test_Suppliers_2016

select DISTINCT PID, CAST(AVG(COST) as NUMERIC(8,2)) as "AVG COST", CAST(MAX(COST) as \
NUMERIC(8,2)) as "MAX COST", CAST(MIN(COST) as NUMERIC(8,2)) \
as "MIN COST" from Test_Catalog_2016 GROUP BY PID

select DISTINCT SNAME, COUNT(REDS) from Test_Suppliers_2016 S, Test_Catalog_2016 \
A where S.SID = A.SID where REDS IN (SELECT COLOR from Test_Parts_2016) 


select SNAME, PNAME, COLOR from \
Test_Suppliers_2016 A, Test_Parts_2016 B, \
Test_Catalog_2016 C where A.SID = C.SID AND B.PID = C.PID


WITH t1 (SID, PID, SNAME, COLOR) AS (SELECT S.SID, P.PID, S.SNAME, P.COLOR FROM
test_suppliers_2016 S, test_catalog_2016 C, test_parts_2016 P WHERE S.SID =
C.SID AND P.PID = C.PID) SELECT SNAME, COUNT(*) AS RED_PARTS_# FROM t1 WHERE
COLOR = 'red' GROUP BY (SNAME)

select DISTINCT SNAME, COUNT(B.COLOR) as RED_PARTS_# from Test_Suppliers_2016, \
(select * from Test_Parts_2016 where COLOR='red') B, \
Test_Catalog_2016 C where B.PID = C.PID GROUP BY SNAME
