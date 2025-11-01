USE AirQualityDB_DDS;
GO 

ALTER TABLE Dim_Date
ADD DayLightSaving bit;

GO 

UPDATE Dim_Date
SET DayLightSaving = 
    CASE 
        WHEN ((Month = 3 AND Day >= 12) 
		OR (MONTH > 3 AND MONTH < 11) 
		OR (MONTH = 11 AND DAY <=5) ) AND YEAR = 2023
		THEN 1
        ELSE 0
    END;
