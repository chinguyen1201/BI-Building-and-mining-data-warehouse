USE STAGE
GO

CREATE TABLE AQI_2021_SATGE
(
    id INT PRIMARY KEY IDENTITY(1, 1),
    [county Name] VARCHAR(50) NOT NULL,
    [State Name] VARCHAR(50) NOT NULL,
    [State Code] VARCHAR(50) NOT NULL,
    [County Code] VARCHAR(50) NOT NULL,
    Date VARCHAR(50) NOT NULL,
    AQI INT NOT NULL,
    Category VARCHAR(50) NOT NULL,
    [Defining Parameter] VARCHAR(50) NOT NULL,
    [Defining Site] VARCHAR(50) NOT NULL,
    [Number of Sites Reporting] VARCHAR(50) NOT NULL,
    [Created] VARCHAR(50) NOT NULL,
    [Last Updated] VARCHAR(50) NOT NULL
);

CREATE TABLE AQI_2022_SATGE
(
    id INT PRIMARY KEY IDENTITY(1, 1),
    [county Name] VARCHAR(50) NOT NULL,
    [State Name] VARCHAR(50) NOT NULL,
    [State Code] VARCHAR(50) NOT NULL,
    [County Code] VARCHAR(50) NOT NULL,
    Date VARCHAR(50) NOT NULL,
    AQI INT NOT NULL,
    Category VARCHAR(50) NOT NULL,
    [Defining Parameter] VARCHAR(50) NOT NULL,
    [Defining Site] VARCHAR(50) NOT NULL,
    [Number of Sites Reporting] VARCHAR(50) NOT NULL,
    [Created] VARCHAR(50) NOT NULL,
    [Last Updated] VARCHAR(50) NOT NULL
);
GO

CREATE TABLE AQI_2023_SATGE
(
    id INT PRIMARY KEY IDENTITY(1, 1),
    [county Name] VARCHAR(50) NOT NULL,
    [State Name] VARCHAR(50) NOT NULL,
    [State Code] VARCHAR(50) NOT NULL,
    [County Code] VARCHAR(50) NOT NULL,
    Date VARCHAR(50) NOT NULL,
    AQI INT NOT NULL,
    Category VARCHAR(50) NOT NULL,
    [Defining Parameter] VARCHAR(50) NOT NULL,
    [Defining Site] VARCHAR(50) NOT NULL,
    [Number of Sites Reporting] VARCHAR(50) NOT NULL,
    [Created] VARCHAR(50) NOT NULL,
    [Last Updated] VARCHAR(50) NOT NULL
);
GO

CREATE TABLE USCOUNTIES_STAGE
(
    id INT PRIMARY KEY IDENTITY(1, 1),
    [county] VARCHAR(50) NOT NULL,
    [county_ascii] VARCHAR(50) NOT NULL,
    [county_full] VARCHAR(50) NOT NULL,
    [county_fips] VARCHAR(50) NOT NULL,
    [state_id] VARCHAR(50) NOT NULL,
    [state_name] VARCHAR(50) NOT NULL,
    lat VARCHAR(50) NOT NULL,
    lng VARCHAR(50) NOT NULL,
    population VARCHAR(50) NOT NULL,
);
GO