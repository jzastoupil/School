use master
go
if (exists(select name from sysdatabases where name='SEIS732_Team_05_Star_Schema'))
  begin
    drop database SEIS732_Team_05_Star_Schema;
  end;

go

/*
**  Uncomment next statement to make binary (case-sensitive, accent sensitive)
*/
create database SEIS732_Team_05_Star_Schema collate Latin1_General_BIN
/*
**  Uncomment next statement to make case-insensitive, accent sensitive
*/
/*
**  create database SEIS732_Team_05_Star_Schema collate Latin1_General_CI_AS
*/
go
use master
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

/*
** SEIS732 Microsoft SQL Server 2012 V1
** v13.9.0-34
** (C) Copyright 2013 
** Frank S. Haug
*/


if exists(select 1 from systypes where name='KEY_DOMAIN')
   drop type KEY_DOMAIN
go

if exists(select 1 from systypes where name='KEY_REF_DOMAIN')
   drop type KEY_REF_DOMAIN
go

/*==============================================================*/
/* Domain: KEY_DOMAIN                                           */
/*==============================================================*/
create type KEY_DOMAIN
   from numeric
go

/*==============================================================*/
/* Domain: KEY_REF_DOMAIN                                       */
/*==============================================================*/
create type KEY_REF_DOMAIN
   from numeric
go

/*==============================================================*/
/* Table: CUSTOMER                                              */
/*==============================================================*/
create table CUSTOMER (
   CUST_Key KEY_DOMAIN           identity,
   CUST_ID bigint               not null,
   CUST_City varchar(45)          not null,
   CUST_County varchar(60)          not null,
   CUST_State varchar(2)           not null,
   CUST_Country varchar(60)          not null,
   CUST_Zip varchar(10)          not null,
   constraint PK_CUSTOMER primary key (CUST_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'the customer that bought the vehicle',
   'user', @CurrentUser, 'table', 'CUSTOMER'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customer Surrogate Key',
   'user', @CurrentUser, 'table', 'CUSTOMER', 'column', 'CUST_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customer Production Key',
   'user', @CurrentUser, 'table', 'CUSTOMER', 'column', 'CUST_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customer city name',
   'user', @CurrentUser, 'table', 'CUSTOMER', 'column', 'CUST_City'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customer county name',
   'user', @CurrentUser, 'table', 'CUSTOMER', 'column', 'CUST_County'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customer State (two letter format)',
   'user', @CurrentUser, 'table', 'CUSTOMER', 'column', 'CUST_State'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customer country name',
   'user', @CurrentUser, 'table', 'CUSTOMER', 'column', 'CUST_Country'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customer Zip Code NNNNN-NNNN',
   'user', @CurrentUser, 'table', 'CUSTOMER', 'column', 'CUST_Zip'
go

/*==============================================================*/
/* Table: DEALER                                                */
/*==============================================================*/
create table DEALER (
   DLR_Key KEY_DOMAIN           identity,
   DLR_Code varchar(15)          not null,
   DLR_Name varchar(256)         not null,
   DLR_Address varchar(256)         not null,
   DLR_City varchar(60)          not null,
   DLR_County varchar(60)          not null,
   DLR_State varchar(2)           not null,
   DLR_Country varchar(60)          not null,
   DLR_Zip varchar(10)          not null,
   DLR_Authorized_Makes varchar(30)          not null
      constraint CKC_DLR_Authorized_Makes_DEALER check (DLR_Authorized_Makes in ('Packrat','Behemoth','All_Makes','None','Unknown')),
   DLR_Independent_Or_Corporate varchar(11)          not null
      constraint CKC_DLR_Independent_Or_Corporate_DEALER check (DLR_Independent_Or_Corporate in ('Independent','Corporate')),
   DLR_Email_Address varchar(256)         not null,
   DLR_Initiation_Date datetime             not null,
   DLR_Phone_Number varchar(30)          not null,
   DLR_Official_Website_ID smallint             not null,
   DLR_Official_WebsiteURL varchar(256)         not null,
   DLR_Official_WebsiteAdministrator_Email varchar(256)         not null,
   DLR_Official_Website_Start_Date datetime             not null,
   constraint PK_DEALER primary key (DLR_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'the dealer that sold the vehicle',
   'user', @CurrentUser, 'table', 'DEALER'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer Surrogate Key',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Uniquely identifies a dealer in OLTP',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Code'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer name',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer street address',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Address'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer City Name',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_City'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer County Name',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_County'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer State Name (two letters)',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_State'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer Country Name',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Country'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer zip code NNNNN-NNNN',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Zip'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'each dealer is an authorized seller of "Packrat", "Behemoth", "All_Makes", or "Unknown"',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Authorized_Makes'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'each dealer is either "Independent" or "Corporate"',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Independent_Or_Corporate'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer main email address',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Email_Address'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Date the dealer was initiated',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Initiation_Date'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer Phone Number including area code--For example: "(612)555-1234x1234", or "1-800-555-1234x1234"',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Phone_Number'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'the production key for the official website',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Official_Website_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Website URL (if any) for this dealership',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Official_WebsiteURL'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the email of the web admistrator',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Official_WebsiteAdministrator_Email'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The date when the website first went online',
   'user', @CurrentUser, 'table', 'DEALER', 'column', 'DLR_Official_Website_Start_Date'
go

/*==============================================================*/
/* Table: INCENTIVE_PLAN                                        */
/*==============================================================*/
create table INCENTIVE_PLAN (
   PLAN_Key KEY_DOMAIN           identity,
   PLAN_ID smallint             not null,
   PLAN_Type varchar(15)          not null,
   PLAN_Level varchar(20)          not null,
   PLAN_Name varchar(60)          not null,
   PLAN_Description varchar(256)         not null,
   PLAN_Number_of_Payments smallint             null,
   PLAN_Rate numeric(4,2)         null,
   constraint PK_INCENTIVE_PLAN primary key (PLAN_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'the plan used in the purchase',
   'user', @CurrentUser, 'table', 'INCENTIVE_PLAN'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'plan Surrogate Key',
   'user', @CurrentUser, 'table', 'INCENTIVE_PLAN', 'column', 'PLAN_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'plan Production Key',
   'user', @CurrentUser, 'table', 'INCENTIVE_PLAN', 'column', 'PLAN_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'type of plan',
   'user', @CurrentUser, 'table', 'INCENTIVE_PLAN', 'column', 'PLAN_Type'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Level for a plan',
   'user', @CurrentUser, 'table', 'INCENTIVE_PLAN', 'column', 'PLAN_Level'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'plan name',
   'user', @CurrentUser, 'table', 'INCENTIVE_PLAN', 'column', 'PLAN_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'description of plan',
   'user', @CurrentUser, 'table', 'INCENTIVE_PLAN', 'column', 'PLAN_Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'number of payments in plan',
   'user', @CurrentUser, 'table', 'INCENTIVE_PLAN', 'column', 'PLAN_Number_of_Payments'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Interest rate used in plan',
   'user', @CurrentUser, 'table', 'INCENTIVE_PLAN', 'column', 'PLAN_Rate'
go

/*==============================================================*/
/* Table: MANUFACTURE_DATE                                      */
/*==============================================================*/
create table MANUFACTURE_DATE (
   MDAT_Key KEY_DOMAIN           identity,
   MDAT_Year char(4)              not null
      constraint CKC_MDAT_Year_MANUFACTURE_DATE check (MDAT_Year >= '1900'),
   MDAT_Quarter_KEY smallint             not null,
   MDAT_Quarter_Name varchar(14)          not null,
   MDAT_Quarter_Abbreviation char(2)              not null,
   MDAT_Quarter char(7)              not null,
   MDAT_Week char(11)             not null,
   MDAT_Week_Of_Year smallint             not null
      constraint CKC_MDAT_Week_Of_Year_MANUFACTURE_DATE check (MDAT_Week_Of_Year between 1 and 54),
   MDAT_Week_Of_Quarter smallint             not null
      constraint CKC_MDAT_Week_Of_Quarter_MANUFACTURE_DATE check (MDAT_Week_Of_Quarter between 1 and 15),
   MDAT_Month_KEY smallint             not null,
   MDAT_Month_Number smallint             not null
      constraint CKC_MDAT_Month_Number_MANUFACTURE_DATE check (MDAT_Month_Number between 1 and 12),
   MDAT_Month_Name varchar(9)           not null
      constraint CKC_MDAT_Month_Name_MANUFACTURE_DATE check (MDAT_Month_Name in ('January','February','March','April','May','June','July','August','September','October','November','December')),
   MDAT_Month_Abbreviation char(3)              not null
      constraint CKC_MDAT_Month_Abbreviation_MANUFACTURE_DATE check (MDAT_Month_Abbreviation in ('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC')),
   MDAT_Day_Of_Year smallint             not null
      constraint CKC_MDAT_Day_Of_Year_MANUFACTURE_DATE check (MDAT_Day_Of_Year between 1 and 366),
   MDAT_Day_Of_Quarter smallint             not null,
   MDAT_Day_Of_Week varchar(9)           not null
      constraint CKC_MDAT_Day_Of_Week_MANUFACTURE_DATE check (MDAT_Day_Of_Week in ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')),
   MDAT_Day_of_Month smallint             not null
      constraint CKC_MDAT_Day_of_Month_MANUFACTURE_DATE check (MDAT_Day_of_Month between 1 and 31),
   MDAT_Weekday_Or_Weekend varchar(8)           not null
      constraint CKC_MDAT_Weekday_Or_Weekend_MANUFACTURE_DATE check (MDAT_Weekday_Or_Weekend in ('Weekend','Weekday')),
   MDAT_Date datetime             not null,
   MDAT_Full_Date_Description varchar(18)          not null,
   constraint PK_MANUFACTURE_DATE primary key (MDAT_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'The date that an RRV was Manufactured',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Surrogate Key for the DIM',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Year in 4-digit format CCYY',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Year'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Surrogate Key for Quarter level',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Quarter_KEY'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Quarter Name "xxx Quarter" where xxx = First, Second, Third, or Fourth for example: "First Quarter"
(no quotes in value but other puctuation is present)',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Quarter_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Quarter name abbreviation "Qxxx" where xxx = 1, 2, 3, or 4 for example: "Q1"
(no quotes in value but other puctuation is present)',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Quarter_Abbreviation'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the name for the Quarter Level for example:
"1997-Q1"
(no quotes in value but other puctuation is present)',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Quarter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the name for the Week Level for example:
"1997-Week01"
(no quotes in value but other puctuation is present)',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Week'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Week number of the year as returned by
Datepart(wk,<date>)',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Week_Of_Year'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Weeknumber within the quarter
Q1,Q2,and Q3 have 13 weeks while Q4 will have 13,14, or 15 weeks depending upon the year and the result of datepart(wk,<date>)',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Week_Of_Quarter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Surrogate Key for the Month level',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Month_KEY'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'month number within the year',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Month_Number'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The name of the month',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Month_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'First three letters of the Month Name, uppercased',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Month_Abbreviation'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the number of the day within the year',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Day_Of_Year'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the number of the day within the quarter',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Day_Of_Quarter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Day of the week

For example:
Monday, Tuesday,  Wednesday, Thursday, Friday, Saturday, Sunday',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Day_Of_Week'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Day of the month in format dd',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Day_of_Month'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Type of day 
One of two values:
"Weekday" or "Weekend"
(no quotes in values)',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Weekday_Or_Weekend'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Date in format mm/dd/CCYY
For example:
"01/12/2007"
(no quotes in value but other punctuation is included)',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Date'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Date in format Month-name day-of-month, 4-digit-year
For example:
"January 12, 2007"
(no quotes in value but other punctuation is included)',
   'user', @CurrentUser, 'table', 'MANUFACTURE_DATE', 'column', 'MDAT_Full_Date_Description'
go

/*==============================================================*/
/* Table: MANUFACTURING_PLANT                                   */
/*==============================================================*/
create table MANUFACTURING_PLANT (
   MFG_Key KEY_DOMAIN           identity,
   MFG_Name varchar(60)          not null,
   MFG_Description varchar(256)         not null,
   MFG_Plant_Code varchar(10)          not null,
   MFG_Address varchar(200)         not null,
   MFG_City varchar(60)          not null,
   MFG_County varchar(60)          not null,
   MFG_State varchar(2)           not null,
   MFG_Country varchar(60)          not null,
   MFG_Zip varchar(10)          not null,
   MFG_Date_Established datetime             not null,
   MFG_Number_Of_Workers smallint             not null,
   RTG_ID smallint             not null,
   MFG_Plant_Overall_Rating varchar(10)          not null,
   MFG_Plant_Efficiency_Rating varchar(10)          not null,
   MFG_Plant_Quality_Rating varchar(10)          not null,
   constraint PK_MANUFACTURING_PLANT primary key (MFG_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'the plant that made the vehicle',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'manufacturing plant Surrogate Key',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'manufacturing plant Name',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'description of manufacturing plant',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Uniquely identifies a manufacturing plant in OLTP',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Plant_Code'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'manufacturing plant street address',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Address'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'manufacturing plant city',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_City'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'manufacturing plant county name',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_County'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'manufacturing plant State XX',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_State'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'manufacturing plant country name',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Country'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'manufacturing plant Zip Code NNNNN-NNNN',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Zip'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Date the manufacturing plant was established',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Date_Established'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'number of workers at manufacturing plant',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Number_Of_Workers'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'the production key for the plant rating',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'RTG_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The overall rating for the manufacturing plant.',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Plant_Overall_Rating'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Efficiency rating for the manufacturing plant.',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Plant_Efficiency_Rating'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Quality rating for the manufacturing plant.',
   'user', @CurrentUser, 'table', 'MANUFACTURING_PLANT', 'column', 'MFG_Plant_Quality_Rating'
go

/*==============================================================*/
/* Table: MSA                                                   */
/*==============================================================*/
create table MSA (
   MSA_Micropolitan_Area_Key KEY_DOMAIN           identity,
   MSA_Micropolitan_Area_Population bigint               not null,
   MSA_Micropolitan_Area_ID bigint               not null,
   MSA_Micropolitan_Area_Description varchar(60)          not null,
   MSA_Metropolitan_Area_Population bigint               not null,
   MSA_Metropolitan_Area_ID bigint               not null,
   MSA_Metropolitan_Area_Name varchar(60)          not null,
   MSA_Metropolitan_Area_Key bigint               not null,
   constraint PK_MSA primary key (MSA_Micropolitan_Area_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'the MSA containing the dealership',
   'user', @CurrentUser, 'table', 'MSA'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MSA Surrogate Key for Micropolitan area',
   'user', @CurrentUser, 'table', 'MSA', 'column', 'MSA_Micropolitan_Area_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MSA Population for Micropolitan area',
   'user', @CurrentUser, 'table', 'MSA', 'column', 'MSA_Micropolitan_Area_Population'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MSA Production Key for Micropolitan area',
   'user', @CurrentUser, 'table', 'MSA', 'column', 'MSA_Micropolitan_Area_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MSA Description for Micropolitan area',
   'user', @CurrentUser, 'table', 'MSA', 'column', 'MSA_Micropolitan_Area_Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MSA Population for Metropolitan area',
   'user', @CurrentUser, 'table', 'MSA', 'column', 'MSA_Metropolitan_Area_Population'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MSA Production Key for Metropolitan area',
   'user', @CurrentUser, 'table', 'MSA', 'column', 'MSA_Metropolitan_Area_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MSA Name for Metropolitan area',
   'user', @CurrentUser, 'table', 'MSA', 'column', 'MSA_Metropolitan_Area_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MSA Surrogate Key for Metropolitan area',
   'user', @CurrentUser, 'table', 'MSA', 'column', 'MSA_Metropolitan_Area_Key'
go

/*==============================================================*/
/* Table: PACKAGE                                               */
/*==============================================================*/
create table PACKAGE (
   PKG_Key KEY_DOMAIN           identity,
   PKG_FeatureSet_ID bigint               not null,
   PKG_Package_Suggested_Retail_Price money                not null,
   PKG_Maximum_Number_Sleeping_Adults varchar(50)          not null,
   PKG_Storage_Capacity varchar(50)          not null,
   PKG_Onboard_Water varchar(50)          not null,
   PKG_Kitchen varchar(50)          not null,
   PKG_Bathroom varchar(50)          not null,
   PKG_Furnace varchar(50)          not null,
   PKG_Air_Conditioner varchar(50)          not null,
   PKG_Slide_Outs varchar(50)          not null,
   PKG_Tow_Hitch varchar(50)          not null,
   PKG_Seat_Material varchar(50)          not null,
   PKG_Bedding_Material varchar(50)          not null,
   PKG_Carpeting varchar(50)          not null,
   PKG_Electric varchar(50)          not null,
   PKG_Walls varchar(50)          not null,
   PKG_GasTank varchar(50)          not null,
   PKG_Entertainment_Package varchar(50)          not null,
   PKG_Generator varchar(50)          not null,
   PKG_Solar_Panels varchar(50)          not null,
   constraint PK_PACKAGE primary key (PKG_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'the package bundled with the vehicle',
   'user', @CurrentUser, 'table', 'PACKAGE'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Surrogate Key for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Production Key for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_FeatureSet_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Suggested price for a package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Package_Suggested_Retail_Price'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'number of sleeping areas feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Maximum_Number_Sleeping_Adults'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'storage capacity feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Storage_Capacity'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'onboard water feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Onboard_Water'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'kitchen feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Kitchen'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'bathroom feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Bathroom'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'furnace feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Furnace'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'air conditioning feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Air_Conditioner'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'number of slide out feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Slide_Outs'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'tow hitch feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Tow_Hitch'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'seat material feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Seat_Material'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'bed material feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Bedding_Material'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'carpeting feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Carpeting'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'electric featue for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Electric'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'wall texture feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Walls'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'gas tank feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_GasTank'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'entertainment package feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Entertainment_Package'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'generator feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Generator'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'solar panels feature for package',
   'user', @CurrentUser, 'table', 'PACKAGE', 'column', 'PKG_Solar_Panels'
go

/*==============================================================*/
/* Table: PRODUCT                                               */
/*==============================================================*/
create table PRODUCT (
   PRD_Key KEY_DOMAIN           identity,
   PRD_Make_Key smallint             not null,
   PRD_Make_Name varchar(40)          not null,
   PRD_Make_Description varchar(256)         not null,
   PRD_Model_Key smallint             not null,
   PRD_Model_Name varchar(40)          not null,
   PRD_Model_Description varchar(256)         not null,
   PRD_Class_Key smallint             not null,
   PRD_Class_Name varchar(40)          not null,
   PRD_Class_Description varchar(256)         not null,
   PRD_Color_Key smallint             not null,
   PRD_Color_ID bigint               not null,
   PRD_Color_Name varchar(40)          not null,
   PRD_Color_Description varchar(256)         not null,
   PRD_Model_Year varchar(10)          not null,
   PRD_VehicleType_ID bigint               not null,
   PRD_Manufacturer_Suggested_Retail_Price money                not null,
   PRD_Wholesale_Price money                not null,
   PRD_MMC_ID smallint             not null,
   constraint PK_PRODUCT primary key (PRD_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'the vehicle sold',
   'user', @CurrentUser, 'table', 'PRODUCT'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'product Surrogate Key',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SK for Make level',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Make_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'make name',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Make_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'description of make',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Make_Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SK for Model level',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Model_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'model name',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Model_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'description of model',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Model_Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SK for Class l',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Class_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'class name',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Class_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'description of class',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Class_Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SK for Color level',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Color_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'color Production Key',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Color_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'color name',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Color_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'description of color',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Color_Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Model Year CCYY',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Model_Year'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Production Key for vehicle type',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_VehicleType_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Suggested retail price for product',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Manufacturer_Suggested_Retail_Price'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Suggested wholesale price for product',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_Wholesale_Price'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Production key representing a particular make model and class combination',
   'user', @CurrentUser, 'table', 'PRODUCT', 'column', 'PRD_MMC_ID'
go

/*==============================================================*/
/* Table: PURCHASE_DATE                                         */
/*==============================================================*/
create table PURCHASE_DATE (
   PDAT_Key KEY_DOMAIN           identity,
   PDAT_Year char(4)              not null,
   PDAT_Quarter_KEY smallint             not null,
   PDAT_Quarter_Name varchar(14)          not null,
   PDAT_Quarter_Abbreviation char(2)              not null,
   PDAT_Quarter char(7)              not null,
   PDAT_Week char(11)             not null,
   PDAT_Week_Of_Year smallint             not null
      constraint CKC_PDAT_Week_Of_Year_PURCHASE_DATE check (PDAT_Week_Of_Year between 1 and 54),
   PDAT_Week_Of_Quarter smallint             not null
      constraint CKC_PDAT_Week_Of_Quarter_PURCHASE_DATE check (PDAT_Week_Of_Quarter between 1 and 15),
   PDAT_Month_KEY smallint             not null,
   PDAT_Month_Number smallint             not null
      constraint CKC_PDAT_Month_Number_PURCHASE_DATE check (PDAT_Month_Number between 1 and 12),
   PDAT_Month_Name varchar(9)           not null
      constraint CKC_PDAT_Month_Name_PURCHASE_DATE check (PDAT_Month_Name in ('January','February','March','April','May','June','July','August','September','October','November','December')),
   PDAT_Month_Abbreviation char(3)              not null
      constraint CKC_PDAT_Month_Abbreviation_PURCHASE_DATE check (PDAT_Month_Abbreviation in ('JAN','FEB','MAR','APR','MAY','JUN','JUL','AUG','SEP','OCT','NOV','DEC')),
   PDAT_Day_Of_Year smallint             not null
      constraint CKC_PDAT_Day_Of_Year_PURCHASE_DATE check (PDAT_Day_Of_Year between 1 and 366),
   PDAT_Day_Of_Quarter smallint             not null,
   PDAT_Day_Of_Week varchar(9)           not null,
   PDAT_Day_of_Month smallint             not null
      constraint CKC_PDAT_Day_of_Month_PURCHASE_DATE check (PDAT_Day_of_Month between 1 and 31),
   PDAT_Weekday_Or_Weekend varchar(8)           not null
      constraint CKC_PDAT_Weekday_Or_Weekend_PURCHASE_DATE check (PDAT_Weekday_Or_Weekend in ('Weekend','Weekday')),
   PDAT_Date datetime             not null,
   PDAT_Full_Date_Description varchar(18)          not null,
   constraint PK_PURCHASE_DATE primary key (PDAT_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'The Date that an RRV was purchased',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'purchase date Surrogate Key',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'purchase date Year in format CCYY',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Year'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Surrogate Key for Quarter level',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Quarter_KEY'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Quarter Name "xxx Quarter" where xxx = First, Second, Third, or Fourth for example: "First Quarter"
(no quotes in value but other puctuation is present)',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Quarter_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Quarter name abbreviation "Qxxx" where xxx = 1, 2, 3, or 4 for example: "Q1"
(no quotes in value but other puctuation is present)',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Quarter_Abbreviation'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the name for the Quarter Level for example:
"1997-Q1"
(no quotes in value but other puctuation is present)',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Quarter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the name for the Week Level for example:
"1997-Week01"
(no quotes in value but other puctuation is present)',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Week'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Week number of the year as returned by
Datepart(wk,<date>)',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Week_Of_Year'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Weeknumber within the quarter
Q1,Q2,and Q3 have 13 weeks while Q4 will have 13,14, or 15 weeks depending upon the year and the result of datepart(wk,<date>)',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Week_Of_Quarter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Surrogate Key for the Month level',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Month_KEY'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'month number within the year',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Month_Number'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The name of the month',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Month_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'First three letters of the Month Name, uppercased',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Month_Abbreviation'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the number of the day within the year',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Day_Of_Year'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the number of the day within the quarter',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Day_Of_Quarter'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Monday, Tuesday, Wednesday,Thursday,Friday,Saturday,Sunday',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Day_Of_Week'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Day of the month in format dd',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Day_of_Month'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Type of day 
One of two values:
"Weekday" or "Weekend"
(no quotes in values)',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Weekday_Or_Weekend'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'purchase date in format mm/dd/CCYY',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Date'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'purchase date in format Month day, CCYY',
   'user', @CurrentUser, 'table', 'PURCHASE_DATE', 'column', 'PDAT_Full_Date_Description'
go

/*==============================================================*/
/* Table: RRV_SALES                                             */
/*==============================================================*/
create table RRV_SALES (
   RRV_Key KEY_DOMAIN           identity,
   MDAT_Key KEY_DOMAIN           not null,
   PRD_Key KEY_DOMAIN           not null,
   PDAT_Key KEY_DOMAIN           not null,
   PLAN_Key KEY_DOMAIN           not null,
   DLR_Key KEY_DOMAIN           not null,
   MSA_Micropolitan_Area_Key KEY_DOMAIN           not null,
   SORG_Key KEY_DOMAIN           not null,
   MFG_Key KEY_DOMAIN           not null,
   PKG_Key KEY_DOMAIN           not null,
   CUST_Key KEY_DOMAIN           not null,
   RRV_Actual_Sales_Amount_in_Dollars money                not null,
   RRV_Processing_Fees money                not null,
   RRV_Handling_Fees money                not null,
   RRV_Transit_Fees money                not null,
   RRV_Retail_Or_Wholesale varchar(9)           not null
      constraint CKC_RRV_Retail_Or_Wholesale_RRV_SALES check (RRV_Retail_Or_Wholesale in ('Retail','Wholesale')),
   RRV_Customer_Status varchar(9)           not null
      constraint CKC_RRV_Customer_Status_RRV_SALES check (RRV_Customer_Status in ('FirstTime','Returning')),
   RRV_Serial_Number bigint               not null,
   constraint PK_RRV_SALES primary key (RRV_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'the fact table',
   'user', @CurrentUser, 'table', 'RRV_SALES'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'fact table Surrogate Key',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'RRV_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Surrogate Key for the DIM',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'MDAT_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'product Surrogate Key',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'PRD_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'purchase date Surrogate Key',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'PDAT_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'plan Surrogate Key',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'PLAN_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'dealer Surrogate Key',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'DLR_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'MSA Surrogate Key for Micropolitan area',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'MSA_Micropolitan_Area_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'sales org Surrogate Key',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'SORG_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'manufacturing plant Surrogate Key',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'MFG_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Surrogate Key for package',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'PKG_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'customer Surrogate Key',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'CUST_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'total amount paid by customer FACT',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'RRV_Actual_Sales_Amount_in_Dollars'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Processing fees FACT',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'RRV_Processing_Fees'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Handling fees FACT',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'RRV_Handling_Fees'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Transportation fees FACT',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'RRV_Transit_Fees'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Retail or Wholesale FACT',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'RRV_Retail_Or_Wholesale'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Returning or FirstTime FACT',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'RRV_Customer_Status'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'DD - This is unique for each physical vehicle that is made',
   'user', @CurrentUser, 'table', 'RRV_SALES', 'column', 'RRV_Serial_Number'
go

/*==============================================================*/
/* Index: PDATE_FOR_RRV_SALES_FK                                */
/*==============================================================*/
create index PDATE_FOR_RRV_SALES_FK on RRV_SALES (
PDAT_Key ASC
)
go

/*==============================================================*/
/* Index: DEALER_FOR_RRV_SALES_FK                               */
/*==============================================================*/
create index DEALER_FOR_RRV_SALES_FK on RRV_SALES (
DLR_Key ASC
)
go

/*==============================================================*/
/* Index: SALES_ORG_FOR_RRV_SALES_FK                            */
/*==============================================================*/
create index SALES_ORG_FOR_RRV_SALES_FK on RRV_SALES (
SORG_Key ASC
)
go

/*==============================================================*/
/* Index: MSA_FOR_SALES_FK                                      */
/*==============================================================*/
create index MSA_FOR_SALES_FK on RRV_SALES (
MSA_Micropolitan_Area_Key ASC
)
go

/*==============================================================*/
/* Index: PRODUCT_FOR_RRV_SALES_FK                              */
/*==============================================================*/
create index PRODUCT_FOR_RRV_SALES_FK on RRV_SALES (
PRD_Key ASC
)
go

/*==============================================================*/
/* Index: CUSTOMER_FOR_RRV_SALES_FK                             */
/*==============================================================*/
create index CUSTOMER_FOR_RRV_SALES_FK on RRV_SALES (
CUST_Key ASC
)
go

/*==============================================================*/
/* Index: INCENTIVE_PLAN_FOR_RRV_SALES_FK                       */
/*==============================================================*/
create index INCENTIVE_PLAN_FOR_RRV_SALES_FK on RRV_SALES (
PLAN_Key ASC
)
go

/*==============================================================*/
/* Index: MFG_PLANT_FOR_RRV_SALES_FK                            */
/*==============================================================*/
create index MFG_PLANT_FOR_RRV_SALES_FK on RRV_SALES (
MFG_Key ASC
)
go

/*==============================================================*/
/* Index: PACKAGE_FOR_RRV_SALES_FK                              */
/*==============================================================*/
create index PACKAGE_FOR_RRV_SALES_FK on RRV_SALES (
PKG_Key ASC
)
go

/*==============================================================*/
/* Index: MFG_DATE_FOR_RRV_SALES_FK                             */
/*==============================================================*/
create index MFG_DATE_FOR_RRV_SALES_FK on RRV_SALES (
MDAT_Key ASC
)
go

/*==============================================================*/
/* Table: SALES_ORG                                             */
/*==============================================================*/
create table SALES_ORG (
   SORG_Key KEY_DOMAIN           identity,
   SORG_Zone_ID smallint             not null,
   SORG_Zone_Name varchar(60)          not null,
   SORG_Zone_Manager_Name varchar(60)          not null,
   SORG_Zone_Key smallint             not null,
   SORG_Domain_ID smallint             not null,
   SORG_Domain_Name varchar(60)          not null,
   SORG_Domain_Manager_Name varchar(60)          not null,
   SORG_Region_ID smallint             not null,
   SORG_Region_Name varchar(60)          not null,
   SORG_Region_Manager_Name varchar(60)          not null,
   SORG_Region_Key smallint             not null,
   SORG_Full_Name varchar(256)         not null,
   constraint PK_SALES_ORG primary key (SORG_Key)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'the sales organization that the dealership that sold th vehicle belongs to',
   'user', @CurrentUser, 'table', 'SALES_ORG'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'sales org Surrogate Key',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Sales Zone Production Key',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Zone_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Sales Zone Name',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Zone_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Sales Zone Manager Full Name (First, Middle, Last)',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Zone_Manager_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SK for Zone Level',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Zone_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Sales Domain Production Key',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Domain_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Sales Domain Name',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Domain_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Sales Domain Manager Full Name (First, Middle, Last)
or "<No Domain Manager>"',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Domain_Manager_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Sales Region Production Key',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Region_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Sales Region Name',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Region_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Sales Region Manager Full Name (First, Middle, Last)
or "<No Region Manager>"',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Region_Manager_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'SK for Region Level',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Region_Key'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'concatenation of the names = [Region Name]-(Zone Name)/Domain Name
For example:
"[Region_14]-(Zone_28)/Domain_82"
(no quotes in the value but other punctuation is literal)',
   'user', @CurrentUser, 'table', 'SALES_ORG', 'column', 'SORG_Full_Name'
go

alter table RRV_SALES
   add constraint FK_RRV_SALES_CUSTOMER_for_RRV_Sales_CUSTOMER foreign key (CUST_Key)
      references CUSTOMER (CUST_Key)
go

alter table RRV_SALES
   add constraint FK_RRV_SALES_DEALER_For_RRV_Sales_DEALER foreign key (DLR_Key)
      references DEALER (DLR_Key)
go

alter table RRV_SALES
   add constraint FK_RRV_SALES_INCENTIVE_PLAN_for_RRV_Sales_INCENTIVE_PLAN foreign key (PLAN_Key)
      references INCENTIVE_PLAN (PLAN_Key)
go

alter table RRV_SALES
   add constraint FK_RRV_SALES_MFG_Date_For_RRV_Sales_MANUFACTURE_DATE foreign key (MDAT_Key)
      references MANUFACTURE_DATE (MDAT_Key)
go

alter table RRV_SALES
   add constraint FK_RRV_SALES_MFG_PLANT_for_RRV_Sales_MANUFACTURING_PLANT foreign key (MFG_Key)
      references MANUFACTURING_PLANT (MFG_Key)
go

alter table RRV_SALES
   add constraint FK_RRV_SALES_MSA_For_Sales_MSA foreign key (MSA_Micropolitan_Area_Key)
      references MSA (MSA_Micropolitan_Area_Key)
go

alter table RRV_SALES
   add constraint FK_RRV_SALES_PACKAGE_FOR_RRV_SALES_PACKAGE foreign key (PKG_Key)
      references PACKAGE (PKG_Key)
go

alter table RRV_SALES
   add constraint FK_RRV_SALES_PDATE_for_RRV_Sales_PURCHASE_DATE foreign key (PDAT_Key)
      references PURCHASE_DATE (PDAT_Key)
go

alter table RRV_SALES
   add constraint FK_RRV_SALES_PRODUCT_For_RRV_Sales_PRODUCT foreign key (PRD_Key)
      references PRODUCT (PRD_Key)
go

alter table RRV_SALES
   add constraint FK_RRV_SALES_SALES_ORG_For_RRV_Sales_SALES_ORG foreign key (SORG_Key)
      references SALES_ORG (SORG_Key)
go



/*
** End Script
*/
