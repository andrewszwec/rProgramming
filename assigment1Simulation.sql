USE DT_LUXOTTICA_INSIGHTS_2014
GO


SELECT *
INTO #mytest
FROM test 
WHERE sulfate <> 'NA' OR  nitrate <> 'NA'

SELECT COUNT(*) FROM #mytest

SELECT AVG(CONVERT(DECIMAL(10,5) , nitrate) ) AS nitrateMean
FROM #mytest