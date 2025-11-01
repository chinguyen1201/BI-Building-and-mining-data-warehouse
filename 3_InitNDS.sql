--Create NDS

-- Create the database
CREATE DATABASE AirQualityDB_NDS;
GO

USE AirQualityDB_NDS;
GO


drop database AirQualityDB_NDS;

-- Create the SOURCE table
CREATE TABLE SOURCE (
    SK_Source INT IDENTITY(1,1) PRIMARY KEY,
    source_name VARCHAR(255),
    created DATETIME,
    last_updated DATETIME
);

-- Create the STATE table
CREATE TABLE State (
	SK_State INT IDENTITY(1,1) PRIMARY KEY,
    state_id varchar(10),
    state_name VARCHAR(255),
    state_code VARCHAR(10),
	FK_Source INT,
    created DATETIME,
    last_updated DATETIME,
	FOREIGN KEY (FK_Source) REFERENCES SOURCE(SK_Source)
);

-- Create the COUNTY table
CREATE TABLE County (
    SK_County INT IDENTITY(1,1) PRIMARY KEY,
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
    FOREIGN KEY (FK_State) REFERENCES State(SK_State)
);

-- Create the CATEGORY table
CREATE TABLE Category (
    SK_Category INT IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(255),
    range VARCHAR(10),
    description VARCHAR(MAX),
    created DATETIME,
    last_updated DATETIME
);

-- Create the PARAM table
CREATE TABLE Param (
    SK_Param INT IDENTITY(1,1) PRIMARY KEY,
    param_name VARCHAR(255),
    description VARCHAR(MAX),
    created DATETIME,
    last_updated DATETIME
);

-- Create the SITE table
CREATE TABLE Site (
    SK_Site INT IDENTITY(1,1) PRIMARY KEY,
    defining_site_code VARCHAR(255),
	FK_County INT,
    created DATETIME,
    last_updated DATETIME,
	FOREIGN KEY (FK_County) REFERENCES County(SK_County)
);

-- Create the AQI table
CREATE TABLE AQI (
    SK_AQI INT IDENTITY(1,1) PRIMARY KEY,
	AQI INT,
    FK_Category INT,
    FK_Param INT,
    FK_Site INT,
    NumberOfSites INT,
	Date DATETIME,
	created DATETIME,
	last_updated DATETIME,
    FOREIGN KEY (FK_Category) REFERENCES Category(SK_Category),
    FOREIGN KEY (FK_Param) REFERENCES Param(SK_Param),
    FOREIGN KEY (FK_Site) REFERENCES Site(SK_Site)
);


