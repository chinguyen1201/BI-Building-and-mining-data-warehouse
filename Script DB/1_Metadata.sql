CREATE DATABASE AirQualityDB_Metadata

USE AirQualityDB_Metadata
GO

create table data_flow
(id int not null identity(1,1)
,name varchar(20) not null
,LSET datetime
,CET datetime
,constraint pk_data_flow
primary key clustered (id)
)
go
