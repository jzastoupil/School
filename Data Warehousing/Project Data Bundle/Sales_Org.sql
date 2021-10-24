use master
go
if (exists(select name from sysdatabases where name='SEIS732_Team_05_Sales_Org'))
  begin
    drop database SEIS732_Team_05_Sales_Org;
  end;

go

/*
**  Uncomment next statement to make binary (case-sensitive, accent sensitive)
*/
create database SEIS732_Team_05_Sales_Org collate Latin1_General_BIN
/*
**  Uncomment next statement to make case-insensitive, accent sensitive
*/
/*
**  create database SEIS732_Team_05_Sales_Org collate Latin1_General_CI_AS
*/
go
use master
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

/*
** SEIS732 Microsoft SQL Server 2012 V1
** v13.9.0-34
** (C) Copyright 2013 
** Frank S. Haug
*/


/*==============================================================*/
/* Table: Dealer                                                */
/*==============================================================*/
create table Dealer (
   DLR_ID smallint             not null,
   MICSA_ID bigint               not null,
   ST_ID smallint             not null,
   DLR_Zip varchar(10)          not null,
   DLR_Code varchar(15)          not null,
   DLR_Phone varchar(20)          not null,
   DLR_Type varchar(1)           not null
      constraint CKC_DLR_Type_Dealer check (DLR_Type in ('P','B','A') and DLR_Type = upper(DLR_Type)),
   constraint PK_Dealer primary key nonclustered (DLR_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a corporate or independent dealership',
   'user', @CurrentUser, 'table', 'Dealer'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Primary Identifier Attribute for the Dealer',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies a Micropolitan SA',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'MICSA_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies a sales territory',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'ST_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The Zip code for the Dealer',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_Zip'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the identifier (unique) for a dealership',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_Code'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the phone number for the dealership',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_Phone'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the type for the dealership, P=Packrat, B=Behmoth, A=ALL (packrat and Behemoth)',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_Type'
go

/*==============================================================*/
/* Index: DEALER_HAS_ST_FK                                      */
/*==============================================================*/
create index DEALER_HAS_ST_FK on Dealer (
ST_ID ASC
)
go

/*==============================================================*/
/* Index: DEALER_IN_MSA_FK                                      */
/*==============================================================*/
create index DEALER_IN_MSA_FK on Dealer (
MICSA_ID ASC
)
go

/*==============================================================*/
/* Table: Metropolitan_Statistical_Area                         */
/*==============================================================*/
create table Metropolitan_Statistical_Area (
   MSA_ID bigint               not null,
   MSA_Name varchar(60)          not null,
   MSA_Description varchar(100)         not null,
   MSA_Population bigint               not null,
   constraint PK_Metropolitan_Statistical_Area primary key nonclustered (MSA_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is the Name of an MSA as defined by the United States Office of Management and Budget (OMB) according to published standards that are applied to Census Bureau data.',
   'user', @CurrentUser, 'table', 'Metropolitan_Statistical_Area'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies an MSA',
   'user', @CurrentUser, 'table', 'Metropolitan_Statistical_Area', 'column', 'MSA_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the name of the MSA as specified by the government',
   'user', @CurrentUser, 'table', 'Metropolitan_Statistical_Area', 'column', 'MSA_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is an informal description of the MSA.',
   'user', @CurrentUser, 'table', 'Metropolitan_Statistical_Area', 'column', 'MSA_Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the population for the MSA',
   'user', @CurrentUser, 'table', 'Metropolitan_Statistical_Area', 'column', 'MSA_Population'
go

/*==============================================================*/
/* Table: Micropolitan_Statistical_Area                         */
/*==============================================================*/
create table Micropolitan_Statistical_Area (
   MICSA_ID bigint               not null,
   MSA_ID bigint               not null,
   MICSA_Description varchar(100)         not null,
   MICSA_Population bigint               not null,
   constraint PK_Micropolitan_Statistical_Area primary key nonclustered (MICSA_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is specific subset of an MSA (loosely based upon the zip code).
There can be one or more MSA_Zip_Code subsets for each MSA',
   'user', @CurrentUser, 'table', 'Micropolitan_Statistical_Area'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies a Micropolitan SA',
   'user', @CurrentUser, 'table', 'Micropolitan_Statistical_Area', 'column', 'MICSA_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies an MSA',
   'user', @CurrentUser, 'table', 'Micropolitan_Statistical_Area', 'column', 'MSA_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the description of the MICSA',
   'user', @CurrentUser, 'table', 'Micropolitan_Statistical_Area', 'column', 'MICSA_Description'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the population for the MICSA',
   'user', @CurrentUser, 'table', 'Micropolitan_Statistical_Area', 'column', 'MICSA_Population'
go

/*==============================================================*/
/* Index: MSA_HAS_MICROSA_FK                                    */
/*==============================================================*/
create index MSA_HAS_MICROSA_FK on Micropolitan_Statistical_Area (
MSA_ID ASC
)
go

/*==============================================================*/
/* Table: Sales_Area                                            */
/*==============================================================*/
create table Sales_Area (
   SA_ID smallint             not null,
   SD_ID smallint             not null,
   MGR_ID smallint             null,
   SA_Name varchar(60)          not null,
   SA_Desc varchar(256)         not null,
   constraint PK_Sales_Area primary key nonclustered (SA_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a sales Area it is a grouping of Sales Territories',
   'user', @CurrentUser, 'table', 'Sales_Area'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies the sales area',
   'user', @CurrentUser, 'table', 'Sales_Area', 'column', 'SA_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies the sales district',
   'user', @CurrentUser, 'table', 'Sales_Area', 'column', 'SD_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies a sales manager',
   'user', @CurrentUser, 'table', 'Sales_Area', 'column', 'MGR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The name of the sales area',
   'user', @CurrentUser, 'table', 'Sales_Area', 'column', 'SA_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a description of the Sales Area',
   'user', @CurrentUser, 'table', 'Sales_Area', 'column', 'SA_Desc'
go

/*==============================================================*/
/* Index: SD_HAS_SA_FK                                          */
/*==============================================================*/
create index SD_HAS_SA_FK on Sales_Area (
SD_ID ASC
)
go

/*==============================================================*/
/* Index: MANAGES_SA_FK                                         */
/*==============================================================*/
create index MANAGES_SA_FK on Sales_Area (
MGR_ID ASC
)
go

/*==============================================================*/
/* Table: Sales_District                                        */
/*==============================================================*/
create table Sales_District (
   SD_ID smallint             not null,
   MGR_ID smallint             null,
   SD_Name varchar(60)          not null,
   SD_Desc varchar(256)         not null,
   constraint PK_Sales_District primary key nonclustered (SD_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a Sales District it is a grouping of Sales Areas',
   'user', @CurrentUser, 'table', 'Sales_District'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies the sales district',
   'user', @CurrentUser, 'table', 'Sales_District', 'column', 'SD_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies a sales manager',
   'user', @CurrentUser, 'table', 'Sales_District', 'column', 'MGR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The name of the sales district',
   'user', @CurrentUser, 'table', 'Sales_District', 'column', 'SD_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a description of the Sales District',
   'user', @CurrentUser, 'table', 'Sales_District', 'column', 'SD_Desc'
go

/*==============================================================*/
/* Index: MANAGES_SD_FK                                         */
/*==============================================================*/
create index MANAGES_SD_FK on Sales_District (
MGR_ID ASC
)
go

/*==============================================================*/
/* Table: Sales_Mgr                                             */
/*==============================================================*/
create table Sales_Mgr (
   MGR_ID smallint             not null,
   MGR_First_Name varchar(60)          not null,
   MGR_Last_Name varchar(60)          not null,
   MGR_Email varchar(256)         not null,
   MGR_Experience smallint             not null,
   constraint PK_Sales_Mgr primary key nonclustered (MGR_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is the manager of a Sales District, Sales Area, or Sales Territory.

It is possible for a manager to manage more than one sales unit, even sales units at different levels (but that is not very common)',
   'user', @CurrentUser, 'table', 'Sales_Mgr'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies a sales manager',
   'user', @CurrentUser, 'table', 'Sales_Mgr', 'column', 'MGR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The first name of a (district, area or territorial) manager in the sales organization',
   'user', @CurrentUser, 'table', 'Sales_Mgr', 'column', 'MGR_First_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The last name of a (district, area or territorial) manager in the sales organization',
   'user', @CurrentUser, 'table', 'Sales_Mgr', 'column', 'MGR_Last_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The email address for this manager',
   'user', @CurrentUser, 'table', 'Sales_Mgr', 'column', 'MGR_Email'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the number of full years that the manager has been managing at some level (district, area, or territorial)',
   'user', @CurrentUser, 'table', 'Sales_Mgr', 'column', 'MGR_Experience'
go

/*==============================================================*/
/* Table: Sales_Territory                                       */
/*==============================================================*/
create table Sales_Territory (
   ST_ID smallint             not null,
   SA_ID smallint             not null,
   MGR_ID smallint             null,
   ST_Name varchar(60)          not null,
   ST_Desc varchar(256)         not null,
   constraint PK_Sales_Territory primary key nonclustered (ST_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a Sales Territory, it is a grouping of Dealerships',
   'user', @CurrentUser, 'table', 'Sales_Territory'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies a sales territory',
   'user', @CurrentUser, 'table', 'Sales_Territory', 'column', 'ST_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies the sales area',
   'user', @CurrentUser, 'table', 'Sales_Territory', 'column', 'SA_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'Identifies a sales manager',
   'user', @CurrentUser, 'table', 'Sales_Territory', 'column', 'MGR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The name of the sales territory',
   'user', @CurrentUser, 'table', 'Sales_Territory', 'column', 'ST_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a description of the Sales Territory',
   'user', @CurrentUser, 'table', 'Sales_Territory', 'column', 'ST_Desc'
go

/*==============================================================*/
/* Index: SA_HAS_ST_FK                                          */
/*==============================================================*/
create index SA_HAS_ST_FK on Sales_Territory (
SA_ID ASC
)
go

/*==============================================================*/
/* Index: MANAGES_ST_FK                                         */
/*==============================================================*/
create index MANAGES_ST_FK on Sales_Territory (
MGR_ID ASC
)
go

alter table Dealer
   add constraint FK_Dealer_Dealer_Has_ST_Sales_Territory foreign key (ST_ID)
      references Sales_Territory (ST_ID)
go

alter table Dealer
   add constraint FK_Dealer_Dealer_In_MSA_Micropolitan_Statistical_Area foreign key (MICSA_ID)
      references Micropolitan_Statistical_Area (MICSA_ID)
go

alter table Micropolitan_Statistical_Area
   add constraint FK_Micropolitan_Statistical_Area_MSA_has_MicroSA_Metropolitan_Statistical_Area foreign key (MSA_ID)
      references Metropolitan_Statistical_Area (MSA_ID)
go

alter table Sales_Area
   add constraint FK_Sales_Area_Manages_SA_Sales_Mgr foreign key (MGR_ID)
      references Sales_Mgr (MGR_ID)
go

alter table Sales_Area
   add constraint FK_Sales_Area_SD_Has_SA_Sales_District foreign key (SD_ID)
      references Sales_District (SD_ID)
go

alter table Sales_District
   add constraint FK_Sales_District_Manages_SD_Sales_Mgr foreign key (MGR_ID)
      references Sales_Mgr (MGR_ID)
go

alter table Sales_Territory
   add constraint FK_Sales_Territory_Manages_ST_Sales_Mgr foreign key (MGR_ID)
      references Sales_Mgr (MGR_ID)
go

alter table Sales_Territory
   add constraint FK_Sales_Territory_SA_Has_ST_Sales_Area foreign key (SA_ID)
      references Sales_Area (SA_ID)
go



/*
** End Script
*/
