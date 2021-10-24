use master
go
if (exists(select name from sysdatabases where name='SEIS732_Team_05_Corporate'))
  begin
    drop database SEIS732_Team_05_Corporate;
  end;

go

/*
**  Uncomment next statement to make binary (case-sensitive, accent sensitive)
*/
create database SEIS732_Team_05_Corporate collate Latin1_General_BIN
/*
**  Uncomment next statement to make case-insensitive, accent sensitive
*/
/*
**  create database SEIS732_Team_05_Corporate collate Latin1_General_CI_AS
*/
go
use master
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

/*
** SEIS732 Microsoft SQL Server 2012 V1
** v13.9.0-34
** (C) Copyright 2013 
** Frank S. Haug
*/


/*==============================================================*/
/* Table: Branch                                                */
/*==============================================================*/
create table Branch (
   BR_ID smallint             not null,
   DEP_Code varchar(10)          null,
   BR_Address varchar(200)         not null,
   BR_City varchar(60)          not null,
   BR_County varchar(60)          null,
   BR_State varchar(2)           not null,
   BR_Country varchar(60)          not null,
   BR_Zip varchar(10)          not null,
   BR_Phone varchar(20)          not null,
   BR_Extension varchar(10)          null,
   BR_Type varchar(1)           null default 'D'
      constraint CKC_BR_Type_Branch check (BR_Type is null or (BR_Type in ('P','D','C','W') and BR_Type = upper(BR_Type))),
   constraint PK_Branch primary key nonclustered (BR_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a branch office',
   'user', @CurrentUser, 'table', 'Branch'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Uniquely identifies a branch.',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'BR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID for the department',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'DEP_Code'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The street address including suite number for the branch''s mailing address.',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'BR_Address'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The name of the city for the branch''s mailing address.',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'BR_City'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the county for the branch''s mailing address.',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'BR_County'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The state for the branch''s mailing address.',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'BR_State'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the country for the branch''s mailing address.',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'BR_Country'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The postal zipcode for the branch''s mailing address.',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'BR_Zip'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'External phone number for the branch.',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'BR_Phone'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the internal phone extension used to dial this branch''s main switchboard.',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'BR_Extension'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is one of the following values:
''P'' for Plant
''C'' for Corporate Dealership, 
''W'' for Warehouse,
or ''D'' for "any other kind of " Department ',
   'user', @CurrentUser, 'table', 'Branch', 'column', 'BR_Type'
go

/*==============================================================*/
/* Index: DEPT_HAS_BRANCH_FK                                    */
/*==============================================================*/
create index DEPT_HAS_BRANCH_FK on Branch (
DEP_Code ASC
)
go

/*==============================================================*/
/* Table: Dealership                                            */
/*==============================================================*/
create table Dealership (
   DLR_ID smallint             not null,
   BR_ID smallint             null,
   OADR_ID smallint             null,
   WEB_ID smallint             not null,
   DLR_Since datetime             not null,
   DLR_Email varchar(256)         not null,
   DLR_Code varchar(15)          not null,
   DLR_Type varchar(1)           null default 'C'
      constraint CKC_DLR_Type_Dealership check (DLR_Type is null or (DLR_Type in ('C','I') and DLR_Type = upper(DLR_Type))),
   CD_Name varchar(200)         null,
   CD_Mgr_Lname varchar(100)         null,
   CD_MGR_Fname varchar(100)         null,
   ID_Name varchar(256)         null,
   ID_Renewal_Date datetime             null,
   constraint PK_Dealership primary key nonclustered (DLR_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a corporate or independent dealership',
   'user', @CurrentUser, 'table', 'Dealership'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies the Dealership.',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'DLR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Uniquely identifies a branch.',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'BR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Date that this Dealership began selling RRV''s.',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'DLR_Since'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Email address for this dealership',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'DLR_Email'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the corporate identifier (unique) for a dealership',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'DLR_Code'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is "C" for Corporate, "I" for Independent',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'DLR_Type'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This serves as a candidate key for the Corporate Dealers',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'CD_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the last name of the person responsible for managing this corporate dealership',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'CD_Mgr_Lname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the first name of the person responsible for managing this corporate dealership',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'CD_MGR_Fname'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This serves as a candidate key for the independents.',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'ID_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The date of the next renewal contract for this dealership',
   'user', @CurrentUser, 'table', 'Dealership', 'column', 'ID_Renewal_Date'
go

/*==============================================================*/
/* Index: HAS_WEBSITE_FK                                        */
/*==============================================================*/
create index HAS_WEBSITE_FK on Dealership (
WEB_ID ASC
)
go

/*==============================================================*/
/* Index: MANAGES_FK                                            */
/*==============================================================*/
create index MANAGES_FK on Dealership (
BR_ID ASC
)
go

/*==============================================================*/
/* Index: HAS_ADDRESS_FK                                        */
/*==============================================================*/
create index HAS_ADDRESS_FK on Dealership (
OADR_ID ASC
)
go

/*==============================================================*/
/* Table: Department                                            */
/*==============================================================*/
create table Department (
   DEP_Code varchar(10)          not null,
   DEP_Name varchar(40)          not null,
   DEP_Class varchar(5)           not null,
   constraint PK_Department primary key nonclustered (DEP_Code)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a corporate Department',
   'user', @CurrentUser, 'table', 'Department'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'ID for the department',
   'user', @CurrentUser, 'table', 'Department', 'column', 'DEP_Code'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Candidate Key for the Department',
   'user', @CurrentUser, 'table', 'Department', 'column', 'DEP_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies the type of department',
   'user', @CurrentUser, 'table', 'Department', 'column', 'DEP_Class'
go

/*==============================================================*/
/* Table: Owner                                                 */
/*==============================================================*/
create table Owner (
   OWN_ID smallint             not null,
   OWN_Name varchar(200)         not null,
   constraint PK_Owner primary key nonclustered (OWN_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a company or individual that owns (and is therefore reponsible for managing) at least one independent dealership.',
   'user', @CurrentUser, 'table', 'Owner'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Uniquely identifies an owner of an independent dealership',
   'user', @CurrentUser, 'table', 'Owner', 'column', 'OWN_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the name of a person who (as representing a company or individual) owns at least one independent dealership.

name is of the format: Last,First',
   'user', @CurrentUser, 'table', 'Owner', 'column', 'OWN_Name'
go

/*==============================================================*/
/* Table: Owner_Address                                         */
/*==============================================================*/
create table Owner_Address (
   OADR_ID smallint             not null,
   OWN_ID smallint             not null,
   OADR_Address varchar(256)         not null,
   OADR_City varchar(60)          not null,
   OADR_County varchar(60)          null,
   OADR_State varchar(2)           not null,
   OADR_Country varchar(60)          null default 'USA',
   OADR_Zip varchar(10)          not null,
   OADR_Phone varchar(20)          not null,
   constraint PK_Owner_Address primary key nonclustered (OADR_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This represents the address used by an owner for one or more independent dealerships owned by that owner.',
   'user', @CurrentUser, 'table', 'Owner_Address'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Uniquely identifies an owner of an independent dealership',
   'user', @CurrentUser, 'table', 'Owner_Address', 'column', 'OWN_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The street address of an owner',
   'user', @CurrentUser, 'table', 'Owner_Address', 'column', 'OADR_Address'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The city address of an owner',
   'user', @CurrentUser, 'table', 'Owner_Address', 'column', 'OADR_City'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The country address of an owner',
   'user', @CurrentUser, 'table', 'Owner_Address', 'column', 'OADR_County'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The state address of an owner',
   'user', @CurrentUser, 'table', 'Owner_Address', 'column', 'OADR_State'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The country address of an owner',
   'user', @CurrentUser, 'table', 'Owner_Address', 'column', 'OADR_Country'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The postal zip code for an owner',
   'user', @CurrentUser, 'table', 'Owner_Address', 'column', 'OADR_Zip'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The buisness phone for an owner',
   'user', @CurrentUser, 'table', 'Owner_Address', 'column', 'OADR_Phone'
go

/*==============================================================*/
/* Index: OWNS_ADDRESS_FK                                       */
/*==============================================================*/
create index OWNS_ADDRESS_FK on Owner_Address (
OWN_ID ASC
)
go

/*==============================================================*/
/* Table: Plant                                                 */
/*==============================================================*/
create table Plant (
   BR_ID smallint             not null,
   RTG_ID smallint             not null,
   PLA_Name varchar(60)          not null,
   PLA_Desc varchar(256)         null,
   PLA_Established datetime             not null,
   PLA_WorkForce smallint             null,
   PLA_Code varchar(10)          not null,
   constraint PK_Plant primary key (BR_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a manufacturing plant, where RRV''s are built.  Each RRV built in a particular plant is marked with the plant code for that plant.',
   'user', @CurrentUser, 'table', 'Plant'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Uniquely identifies a branch.',
   'user', @CurrentUser, 'table', 'Plant', 'column', 'BR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The name for a manufacturing plant',
   'user', @CurrentUser, 'table', 'Plant', 'column', 'PLA_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The description for a manufacturing plant.',
   'user', @CurrentUser, 'table', 'Plant', 'column', 'PLA_Desc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The date that a manufacturing plant was established',
   'user', @CurrentUser, 'table', 'Plant', 'column', 'PLA_Established'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The size of the workforce at a manufacturing plant.',
   'user', @CurrentUser, 'table', 'Plant', 'column', 'PLA_WorkForce'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The plant code, a unique identifier stamped in each RRV''s built in this plant',
   'user', @CurrentUser, 'table', 'Plant', 'column', 'PLA_Code'
go

/*==============================================================*/
/* Index: HAS_RATING_FK                                         */
/*==============================================================*/
create index HAS_RATING_FK on Plant (
RTG_ID ASC
)
go

/*==============================================================*/
/* Table: Ratings                                               */
/*==============================================================*/
create table Ratings (
   RTG_ID smallint             not null,
   RTG_Overall_Rating varchar(10)          not null,
   RTG_Eff_Rating varchar(10)          not null,
   RTG_Quality_Rating varchar(10)          not null,
   constraint PK_Ratings primary key nonclustered (RTG_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This Tab le has various rating details',
   'user', @CurrentUser, 'table', 'Ratings'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Rating for a manufacturing plant',
   'user', @CurrentUser, 'table', 'Ratings', 'column', 'RTG_Overall_Rating'
go

/*==============================================================*/
/* Table: Website                                               */
/*==============================================================*/
create table Website (
   WEB_ID smallint             not null,
   WEB_URL varchar(256)         not null,
   WEB_Admin varchar(256)         not null,
   WEB_Start_Date datetime             not null,
   constraint PK_Website primary key nonclustered (WEB_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is the website details for a dealership',
   'user', @CurrentUser, 'table', 'Website'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Website URL (if any) for this dealership',
   'user', @CurrentUser, 'table', 'Website', 'column', 'WEB_URL'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the email of the web admistrator',
   'user', @CurrentUser, 'table', 'Website', 'column', 'WEB_Admin'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The date when the website first went online',
   'user', @CurrentUser, 'table', 'Website', 'column', 'WEB_Start_Date'
go

alter table Branch
   add constraint FK_Branch_Dept_Has_Branch_Department foreign key (DEP_Code)
      references Department (DEP_Code)
go

alter table Dealership
   add constraint FK_Dealership_Has_Address_Owner_Address foreign key (OADR_ID)
      references Owner_Address (OADR_ID)
go

alter table Dealership
   add constraint FK_Dealership_Has_Website_Website foreign key (WEB_ID)
      references Website (WEB_ID)
go

alter table Dealership
   add constraint FK_Dealership_Manages_Branch foreign key (BR_ID)
      references Branch (BR_ID)
go

alter table Owner_Address
   add constraint FK_Owner_Address_Owns_Address_Owner foreign key (OWN_ID)
      references Owner (OWN_ID)
go

alter table Plant
   add constraint FK_Plant_Has_Rating_Ratings foreign key (RTG_ID)
      references Ratings (RTG_ID)
go

alter table Plant
   add constraint FK_Plant_ISA_Branch_Branch foreign key (BR_ID)
      references Branch (BR_ID)
go



/*
** End Script
*/
