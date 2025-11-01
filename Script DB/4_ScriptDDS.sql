--use master;
--drop database AirQualityDB_DDS;

--Create NDS
-- Create the database
CREATE DATABASE AirQualityDB_DDS;
GO

USE AirQualityDB_DDS;
GO
/*
Drop table Fact_AQI;
Drop table Dim_Param;
Drop table Dim_Category;
Drop table Dim_Site;
Drop table Dim_County;
Drop table Dim_State;
*/

-- Create the STATE table
CREATE TABLE Dim_State (
	SK_State INT PRIMARY KEY,
    state_id varchar(10),
    state_name VARCHAR(255),
    state_code VARCHAR(10),
    created DATETIME,
    last_updated DATETIME
)

-- Create the COUNTY table
CREATE TABLE Dim_County (
    SK_County INT PRIMARY KEY,
    county_name VARCHAR(255),
    county_ascii VARCHAR(50),
    county_full VARCHAR(255),
    county_fips VARCHAR(50),
    lat FLOAT,
    lng FLOAT,
    population INT,
    county_code VARCHAR(50),
    FK_State INT,
    created DATETIME,
    last_updated DATETIME,

    FOREIGN KEY (FK_State) REFERENCES Dim_State(SK_state)
);

-- Create the SITE table
CREATE TABLE Dim_Site (
    SK_Site INT PRIMARY KEY,
    defining_site_code VARCHAR(255),
	FK_County INT,
    created DATETIME,
    last_updated DATETIME,

	FOREIGN KEY (FK_County) REFERENCES Dim_County(SK_County)
);

-- Create the CATEGORY table
CREATE TABLE Dim_Category (
    SK_Category INT PRIMARY KEY,
    category_name VARCHAR(255),
    range VARCHAR(10),
    description VARCHAR(MAX),
    created DATETIME,
    last_updated DATETIME
);

-- Create the PARAM table
CREATE TABLE Dim_Param (
    SK_Param INT PRIMARY KEY,
    param_name VARCHAR(255),
    description VARCHAR(MAX),
    created DATETIME,
    last_updated DATETIME
);

-- Create Dim_Date table
CREATE TABLE Dim_Date (
    SK_Date INT IDENTITY(1, 1) PRIMARY KEY,
    Year INT,
    Quarter INT,
    Month INT,
    Day INT
    created DATETIME,
    last_updated DATETIME
);

-- Create the AQI table
CREATE TABLE Fact_AQI (
    SK_AQI INT PRIMARY KEY,
	AQI INT,
    FK_Category INT,
    FK_Param INT,
	FK_Site INT,
    NumberOfSites INT,
	FK_Date INT,
	created DATETIME,
	last_updated DATETIME,

    FOREIGN KEY (FK_Category) REFERENCES Dim_Category(SK_Category),
    FOREIGN KEY (FK_Param) REFERENCES Dim_Param(SK_Param),
    FOREIGN KEY (FK_Site) REFERENCES Dim_Site(SK_Site), 
	FOREIGN KEY (FK_Date) REFERENCES Dim_Date(SK_Date)
);

CREATE OR ALTER PROCEDURE PopulateDateDimension
AS
BEGIN
    INSERT INTO Dim_Date (Day, Month, Quarter, Year)
    SELECT 
        DAY(Date) AS Day,
        MONTH(Date) AS Month,
        CASE 
            WHEN MONTH(Date) IN (1, 2, 3) THEN 1
            WHEN MONTH(Date) IN (4, 5, 6) THEN 2
            WHEN MONTH(Date) IN (7, 8, 9) THEN 3
            ELSE 4
        END AS Quarter,
        YEAR(Date) AS Year
        /*CASE 
            -- Generalized logic for Daylight Saving Time (example for U.S.)
            WHEN Date >= DATEFROMPARTS(YEAR(Date), 3, 8) AND Date <= DATEFROMPARTS(YEAR(Date), 11, 1) THEN 1
            ELSE 0
        END AS DayLightSaving*/
    FROM 
        (SELECT DISTINCT Date FROM AirQualityDB_NDS.dbo.AQI) AS AQI
    ORDER BY 
        Date ASC;
END;
EXECUTE PopulateDateDimension
