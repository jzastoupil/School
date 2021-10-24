use master
go
if (exists(select name from sysdatabases where name='SEIS732_Team_05_Corporate'))
  begin
    drop database SEIS732_Team_05_Corporate;
  end;

go
if (exists(select name from sysdatabases where name='SEIS732_Team_05_Products'))
  begin
    drop database SEIS732_Team_05_Products;
  end;

go
if (exists(select name from sysdatabases where name='SEIS732_Team_05_Sales_Org'))
  begin
    drop database SEIS732_Team_05_Sales_Org;
  end;

go
if (exists(select name from sysdatabases where name='SEIS732_Team_05_Star_Schema'))
  begin
    drop database SEIS732_Team_05_Star_Schema;
  end;

go
if exists(select name from syslogins where name='SEIS732_Team_05_Corporate_User')
exec sp_droplogin 'SEIS732_Team_05_Corporate_User'
go
create login SEIS732_Team_05_Corporate_User with password='2017_Roll_05', default_database=master, default_language=us_english, check_expiration=off, check_policy=off
go
if exists(select name from syslogins where name='SEIS732_Team_05_Products_User')
exec sp_droplogin 'SEIS732_Team_05_Products_User'
go
create login SEIS732_Team_05_Products_User with password='2017_Roll_05', default_database=master, default_language=us_english, check_expiration=off, check_policy=off
go
if exists(select name from syslogins where name='SEIS732_Team_05_Sales_Org_User')
exec sp_droplogin 'SEIS732_Team_05_Sales_Org_User'
go
create login SEIS732_Team_05_Sales_Org_User with password='2017_Roll_05', default_database=master, default_language=us_english, check_expiration=off, check_policy=off
go
if exists(select name from syslogins where name='SEIS732_Team_05_Star_Schema_User')
exec sp_droplogin 'SEIS732_Team_05_Star_Schema_User'
go
create login SEIS732_Team_05_Star_Schema_User with password='2017_Roll_05', default_database=master, default_language=us_english, check_expiration=off, check_policy=off
go
create database SEIS732_Team_05_Corporate collate SQL_Latin1_General_CP1_CS_AS
go
alter database SEIS732_Team_05_Corporate set recovery bulk_logged ;
go
alter database SEIS732_Team_05_Corporate set auto_shrink on ;
go
use SEIS732_Team_05_Corporate
go
sp_changedbowner 'SEIS732_Team_05_Corporate_User'
go
sp_defaultdb 'SEIS732_Team_05_Corporate_User', 'SEIS732_Team_05_Corporate'
go
create database SEIS732_Team_05_Products collate SQL_Latin1_General_CP1_CS_AS
go
alter database SEIS732_Team_05_Products set recovery bulk_logged ;
go
alter database SEIS732_Team_05_Products set auto_shrink on ;
go
use SEIS732_Team_05_Products
go
sp_changedbowner 'SEIS732_Team_05_Products_User'
go
sp_defaultdb 'SEIS732_Team_05_Products_User', 'SEIS732_Team_05_Products'
go
create database SEIS732_Team_05_Sales_Org collate SQL_Latin1_General_CP1_CS_AS
go
alter database SEIS732_Team_05_Sales_Org set recovery bulk_logged ;
go
alter database SEIS732_Team_05_Sales_Org set auto_shrink on ;
go
use SEIS732_Team_05_Sales_Org
go
sp_changedbowner 'SEIS732_Team_05_Sales_Org_User'
go
sp_defaultdb 'SEIS732_Team_05_Sales_Org_User', 'SEIS732_Team_05_Sales_Org'
go
create database SEIS732_Team_05_Star_Schema collate SQL_Latin1_General_CP1_CS_AS
go
alter database SEIS732_Team_05_Star_Schema set recovery bulk_logged ;
go
alter database SEIS732_Team_05_Star_Schema set auto_shrink on ;
go
use SEIS732_Team_05_Star_Schema
go
sp_changedbowner 'SEIS732_Team_05_Star_Schema_User'
go
sp_defaultdb 'SEIS732_Team_05_Star_Schema_User', 'SEIS732_Team_05_Star_Schema'
go
