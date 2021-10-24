use master
go
if (exists(select name from sysdatabases where name='SEIS732_Team_05_Products'))
  begin
    drop database SEIS732_Team_05_Products;
  end;

go

/*
**  Uncomment next statement to make binary (case-sensitive, accent sensitive)
*/
create database SEIS732_Team_05_Products collate Latin1_General_BIN
/*
**  Uncomment next statement to make case-insensitive, accent sensitive
*/
/*
**  create database SEIS732_Team_05_Products collate Latin1_General_CI_AS
*/
go
use master
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

/*
** SEIS732 Microsoft SQL Server 2012 V1
** v13.9.0-34
** (C) Copyright 2013 
** Frank S. Haug
*/


/*==============================================================*/
/* Table: Allocated                                             */
/*==============================================================*/
create table Allocated (
   RV_Serial_Number bigint               not null,
   DLR_ID bigint               not null,
   Allocation_Date datetime             not null,
   Dealer_Receipt_Date datetime             not null,
   Processing_Fees money                not null,
   Handling_Fees money                not null,
   Transit_Fees money                not null,
   constraint PK_Allocated primary key (RV_Serial_Number)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a physical RV that has been allocated to a dealer',
   'user', @CurrentUser, 'table', 'Allocated'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is unique for each physical vehicle that is made',
   'user', @CurrentUser, 'table', 'Allocated', 'column', 'RV_Serial_Number'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a dealership',
   'user', @CurrentUser, 'table', 'Allocated', 'column', 'DLR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the date that a RRV instance was allocated to a dealership',
   'user', @CurrentUser, 'table', 'Allocated', 'column', 'Allocation_Date'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the date that a dealer physically received a RRV instance',
   'user', @CurrentUser, 'table', 'Allocated', 'column', 'Dealer_Receipt_Date'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the total processing fees for an RRV instance',
   'user', @CurrentUser, 'table', 'Allocated', 'column', 'Processing_Fees'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the total handling fees for an RRV instance',
   'user', @CurrentUser, 'table', 'Allocated', 'column', 'Handling_Fees'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the total fees for an RRV instance',
   'user', @CurrentUser, 'table', 'Allocated', 'column', 'Transit_Fees'
go

/*==============================================================*/
/* Index: ALLOCATED_TO_DEALER_FK                                */
/*==============================================================*/
create index ALLOCATED_TO_DEALER_FK on Allocated (
DLR_ID ASC
)
go

/*==============================================================*/
/* Table: Color                                                 */
/*==============================================================*/
create table Color (
   CLR_ID bigint               not null,
   CLR_Name varchar(40)          not null,
   CLR_Description varchar(256)         null,
   constraint PK_Color primary key nonclustered (CLR_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a color for a vehicle type',
   'user', @CurrentUser, 'table', 'Color'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a color',
   'user', @CurrentUser, 'table', 'Color', 'column', 'CLR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the name for a color',
   'user', @CurrentUser, 'table', 'Color', 'column', 'CLR_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the description of a color.',
   'user', @CurrentUser, 'table', 'Color', 'column', 'CLR_Description'
go

/*==============================================================*/
/* Table: Customer                                              */
/*==============================================================*/
create table Customer (
   CUST_ID bigint               not null,
   CUST_FNAME varchar(30)          not null,
   CUST_MNAME varchar(30)          not null,
   CUST_LNAME varchar(60)          not null,
   CUST_ADDR varchar(60)          not null,
   CUST_CITY varchar(45)          not null,
   CUST_COUNTY varchar(60)          null,
   CUST_STATE varchar(2)           not null,
   CUST_COUNTRY varchar(60)          null,
   CUST_ZIP varchar(10)          not null,
   CUST_HOME varchar(20)          not null,
   CUST_WORK varchar(20)          not null,
   CUST_CELL varchar(20)          not null,
   constraint PK_Customer primary key nonclustered (CUST_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is someone who has bought at least one physical vehicle',
   'user', @CurrentUser, 'table', 'Customer'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a Customer',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s first name',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_FNAME'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s middle name, or initial.',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_MNAME'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s last name',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_LNAME'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s street address',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_ADDR'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s city',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_CITY'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s county',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_COUNTY'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s state ',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_STATE'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s country',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_COUNTRY'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s zip code (10 digit)',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_ZIP'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s home phone number',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_HOME'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s work phone number',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_WORK'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a customer''s cell phone number',
   'user', @CurrentUser, 'table', 'Customer', 'column', 'CUST_CELL'
go

/*==============================================================*/
/* Table: Dealer                                                */
/*==============================================================*/
create table Dealer (
   DLR_ID bigint               not null,
   DLR_Code varchar(15)          not null,
   DLR_Street varchar(60)          not null,
   DLR_City varchar(60)          not null,
   DLR_State varchar(60)          not null,
   DLR_Zip varchar(60)          not null,
   constraint PK_Dealer primary key nonclustered (DLR_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a dealer (a place that sells physical RVs)',
   'user', @CurrentUser, 'table', 'Dealer'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a dealership',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the Code (corporate unique ID) for a dealership',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_Code'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the Street address for a Dealership',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_Street'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the city for a dealership',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_City'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the State for a Dealership',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_State'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the Zip-Code (10 digit) for a dealership',
   'user', @CurrentUser, 'table', 'Dealer', 'column', 'DLR_Zip'
go

/*==============================================================*/
/* Table: Feature                                               */
/*==============================================================*/
create table Feature (
   FEA_ID bigint               not null,
   FS_ID varchar(256)         not null,
   FEA_Type varchar(30)          not null,
   FEA_Value varchar(50)          not null,
   FEA_Description varchar(100)         not null,
   constraint PK_Feature primary key nonclustered (FEA_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is single feature type and value',
   'user', @CurrentUser, 'table', 'Feature'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the id for a feature',
   'user', @CurrentUser, 'table', 'Feature', 'column', 'FEA_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a set of features',
   'user', @CurrentUser, 'table', 'Feature', 'column', 'FS_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the type for a feature',
   'user', @CurrentUser, 'table', 'Feature', 'column', 'FEA_Type'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the value for a feature',
   'user', @CurrentUser, 'table', 'Feature', 'column', 'FEA_Value'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the Description for a feature',
   'user', @CurrentUser, 'table', 'Feature', 'column', 'FEA_Description'
go

/*==============================================================*/
/* Index: HAS_FEATURE_FK                                        */
/*==============================================================*/
create index HAS_FEATURE_FK on Feature (
FS_ID ASC
)
go

/*==============================================================*/
/* Table: FeatureSet                                            */
/*==============================================================*/
create table FeatureSet (
   FS_ID varchar(256)         not null,
   FS_Retail_Price money                not null,
   constraint PK_FeatureSet primary key nonclustered (FS_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a set of feature types and values',
   'user', @CurrentUser, 'table', 'FeatureSet'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a set of features',
   'user', @CurrentUser, 'table', 'FeatureSet', 'column', 'FS_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the suggested price for a set of features',
   'user', @CurrentUser, 'table', 'FeatureSet', 'column', 'FS_Retail_Price'
go

/*==============================================================*/
/* Table: IncentiveProgram                                      */
/*==============================================================*/
create table IncentiveProgram (
   IP_ID smallint             not null,
   IP_Type varchar(15)          not null,
   IP_Level varchar(20)          not null,
   IP_Name varchar(60)          not null,
   IP_Desc varchar(256)         null,
   IP_Num_Payments smallint             null,
   IP_Rate numeric(4,2)         null,
   constraint PK_IncentiveProgram primary key nonclustered (IP_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is the incentive program that an RRV was sold under (there is a standard program used as the default)',
   'user', @CurrentUser, 'table', 'IncentiveProgram'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the id for an incentive program',
   'user', @CurrentUser, 'table', 'IncentiveProgram', 'column', 'IP_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the type for an incentive program',
   'user', @CurrentUser, 'table', 'IncentiveProgram', 'column', 'IP_Type'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This si the level for an incentive program',
   'user', @CurrentUser, 'table', 'IncentiveProgram', 'column', 'IP_Level'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the name for an incentive program',
   'user', @CurrentUser, 'table', 'IncentiveProgram', 'column', 'IP_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the description for an incentive program',
   'user', @CurrentUser, 'table', 'IncentiveProgram', 'column', 'IP_Desc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the number of payments for an incentive program',
   'user', @CurrentUser, 'table', 'IncentiveProgram', 'column', 'IP_Num_Payments'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the rate for an incentive program',
   'user', @CurrentUser, 'table', 'IncentiveProgram', 'column', 'IP_Rate'
go

/*==============================================================*/
/* Table: MMC                                                   */
/*==============================================================*/
create table MMC (
   MMC_ID smallint             not null,
   MMC_Make_Name varchar(40)          not null,
   MMC_Make_Desc varchar(256)         null,
   MMC_Model_Name varchar(40)          not null,
   MMC_Model_Desc varchar(256)         null,
   MMC_Class_Name varchar(40)          not null,
   MMC_Class_Desc varchar(256)         null,
   constraint PK_MMC primary key nonclustered (MMC_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is the make, model. and class information for a vehicle type',
   'user', @CurrentUser, 'table', 'MMC'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a combination of Make, Model, and Class',
   'user', @CurrentUser, 'table', 'MMC', 'column', 'MMC_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the name of a Make',
   'user', @CurrentUser, 'table', 'MMC', 'column', 'MMC_Make_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is a description of a Make',
   'user', @CurrentUser, 'table', 'MMC', 'column', 'MMC_Make_Desc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the Name of a model',
   'user', @CurrentUser, 'table', 'MMC', 'column', 'MMC_Model_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the description of a Model',
   'user', @CurrentUser, 'table', 'MMC', 'column', 'MMC_Model_Desc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the name of the class',
   'user', @CurrentUser, 'table', 'MMC', 'column', 'MMC_Class_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the description of the class',
   'user', @CurrentUser, 'table', 'MMC', 'column', 'MMC_Class_Desc'
go

/*==============================================================*/
/* Table: RRV_Instance                                          */
/*==============================================================*/
create table RRV_Instance (
   RV_Serial_Number bigint               not null,
   FS_ID varchar(256)         not null,
   CLR_ID bigint               not null,
   VT_ID bigint               not null,
   RV_MFG_Plant_Code varchar(10)          not null,
   RV_MFG_Date datetime             not null,
   RV_Status varchar(1)           null default 'U'
      constraint CKC_RV_Status_RRV_Instance check (RV_Status is null or (RV_Status in ('U','S','A') and RV_Status = upper(RV_Status))),
   constraint PK_RRV_Instance primary key nonclustered (RV_Serial_Number)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a physical RV it must have a U, S, or A subtype',
   'user', @CurrentUser, 'table', 'RRV_Instance'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is unique for each physical vehicle that is made',
   'user', @CurrentUser, 'table', 'RRV_Instance', 'column', 'RV_Serial_Number'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a set of features',
   'user', @CurrentUser, 'table', 'RRV_Instance', 'column', 'FS_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a color',
   'user', @CurrentUser, 'table', 'RRV_Instance', 'column', 'CLR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a vehicle type',
   'user', @CurrentUser, 'table', 'RRV_Instance', 'column', 'VT_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This identifies the (one and only one) plant that made this physical RV',
   'user', @CurrentUser, 'table', 'RRV_Instance', 'column', 'RV_MFG_Plant_Code'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the date that the RV was officially passed final inspection at the plant that made it.',
   'user', @CurrentUser, 'table', 'RRV_Instance', 'column', 'RV_MFG_Date'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This value is used to determine which subtype this RV is for:
U=Unallocated
S=Sold
A=Allocated

',
   'user', @CurrentUser, 'table', 'RRV_Instance', 'column', 'RV_Status'
go

/*==============================================================*/
/* Index: HAS_COLOR_FK                                          */
/*==============================================================*/
create index HAS_COLOR_FK on RRV_Instance (
CLR_ID ASC
)
go

/*==============================================================*/
/* Index: HAS_FEATURESET_FK                                     */
/*==============================================================*/
create index HAS_FEATURESET_FK on RRV_Instance (
FS_ID ASC
)
go

/*==============================================================*/
/* Index: HAS_VEHICLE_TYPE_FK                                   */
/*==============================================================*/
create index HAS_VEHICLE_TYPE_FK on RRV_Instance (
VT_ID ASC
)
go

/*==============================================================*/
/* Table: Sold                                                  */
/*==============================================================*/
create table Sold (
   RV_Serial_Number bigint               not null,
   DLR_ID bigint               null,
   IP_ID smallint             null,
   CUST_ID bigint               null,
   Sale_Date datetime             null,
   Actual_Sales_Amount money                null
      constraint CKC_Actual_Sales_Amount_Sold check (Actual_Sales_Amount is null or (Actual_Sales_Amount >= 10000)),
   Sales_Tax_Amount money                null,
   Retail_Or_WholeSale varchar(1)           null default 'R'
      constraint CKC_Retail_Or_WholeSale_Sold check (Retail_Or_WholeSale is null or (Retail_Or_WholeSale in ('R','W'))),
   First_Time_Buyer varchar(1)           null default 'F'
      constraint CKC_First_Time_Buyer_Sold check (First_Time_Buyer is null or (First_Time_Buyer in ('T','F') and First_Time_Buyer = upper(First_Time_Buyer))),
   constraint PK_Sold primary key (RV_Serial_Number)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a physical RV that has been sold',
   'user', @CurrentUser, 'table', 'Sold'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is unique for each physical vehicle that is made',
   'user', @CurrentUser, 'table', 'Sold', 'column', 'RV_Serial_Number'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a dealership',
   'user', @CurrentUser, 'table', 'Sold', 'column', 'DLR_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the id for an incentive program',
   'user', @CurrentUser, 'table', 'Sold', 'column', 'IP_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a Customer',
   'user', @CurrentUser, 'table', 'Sold', 'column', 'CUST_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the date that RRV was actually sold

Madatory if Sold, but NULL if Allocated',
   'user', @CurrentUser, 'table', 'Sold', 'column', 'Sale_Date'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the actual sales amount for a sale (Tax NOT included)

Madatory if Sold, but NULL if Allocated',
   'user', @CurrentUser, 'table', 'Sold', 'column', 'Actual_Sales_Amount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the total sales tax amount (add this and the Actual_Sales_Amount to see the total price paid including all fees but not including interest on a plan)

Madatory if Sold, but NULL if Allocated',
   'user', @CurrentUser, 'table', 'Sold', 'column', 'Sales_Tax_Amount'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   '(R)etail or (W)holeSale

Madatory if Sold, but NULL if Allocated',
   'user', @CurrentUser, 'table', 'Sold', 'column', 'Retail_Or_WholeSale'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is ''T'' if the customer has never bought an RRV ever, otherwise it is ''F'' if this is an existing customer 

Madatory if Sold, but NULL if Allocated',
   'user', @CurrentUser, 'table', 'Sold', 'column', 'First_Time_Buyer'
go

/*==============================================================*/
/* Index: BOUGHT_BY_FK                                          */
/*==============================================================*/
create index BOUGHT_BY_FK on Sold (
CUST_ID ASC
)
go

/*==============================================================*/
/* Index: DEALER_SOLD_VEHICLE_FK                                */
/*==============================================================*/
create index DEALER_SOLD_VEHICLE_FK on Sold (
DLR_ID ASC
)
go

/*==============================================================*/
/* Index: USING_PLAN_FK                                         */
/*==============================================================*/
create index USING_PLAN_FK on Sold (
IP_ID ASC
)
go

/*==============================================================*/
/* Table: Unallocated                                           */
/*==============================================================*/
create table Unallocated (
   RV_Serial_Number bigint               not null,
   WH_ID smallint             not null,
   UNA_Received_Date datetime             not null,
   UNA_Cost money                null,
   constraint PK_Unallocated primary key (RV_Serial_Number)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a physical RV that has not been sold or allocated yet',
   'user', @CurrentUser, 'table', 'Unallocated'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is unique for each physical vehicle that is made',
   'user', @CurrentUser, 'table', 'Unallocated', 'column', 'RV_Serial_Number'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID of a warehouse',
   'user', @CurrentUser, 'table', 'Unallocated', 'column', 'WH_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the date that a physical warehouse recieved an RRV instance

',
   'user', @CurrentUser, 'table', 'Unallocated', 'column', 'UNA_Received_Date'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the total cost for storing an unallocated RRV is stored at/in a physical warehouse

',
   'user', @CurrentUser, 'table', 'Unallocated', 'column', 'UNA_Cost'
go

/*==============================================================*/
/* Index: STORES_UNALLOCATED_FK                                 */
/*==============================================================*/
create index STORES_UNALLOCATED_FK on Unallocated (
WH_ID ASC
)
go

/*==============================================================*/
/* Table: Vehicle_Type                                          */
/*==============================================================*/
create table Vehicle_Type (
   VT_ID bigint               not null,
   MMC_ID smallint             not null,
   VT_Model_Year smallint             not null,
   VT_MSRP money                not null,
   VT_Wholesale_Price money                not null,
   constraint PK_Vehicle_Type primary key nonclustered (VT_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a vehicle type (a unique combination of make, model class, color, and feature sets)',
   'user', @CurrentUser, 'table', 'Vehicle_Type'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a vehicle type',
   'user', @CurrentUser, 'table', 'Vehicle_Type', 'column', 'VT_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID for a combination of Make, Model, and Class',
   'user', @CurrentUser, 'table', 'Vehicle_Type', 'column', 'MMC_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the model year for an RRV type',
   'user', @CurrentUser, 'table', 'Vehicle_Type', 'column', 'VT_Model_Year'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the Manufacturer''s suggested retail price for this vehicle type (not including any feature packages)',
   'user', @CurrentUser, 'table', 'Vehicle_Type', 'column', 'VT_MSRP'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the wholesale price for this vehicle type (not including any feature packages)',
   'user', @CurrentUser, 'table', 'Vehicle_Type', 'column', 'VT_Wholesale_Price'
go

/*==============================================================*/
/* Index: VT_HAS_MMC_FK                                         */
/*==============================================================*/
create index VT_HAS_MMC_FK on Vehicle_Type (
MMC_ID ASC
)
go

/*==============================================================*/
/* Table: Warehouse                                             */
/*==============================================================*/
create table Warehouse (
   WH_ID smallint             not null,
   WH_Name varchar(60)          not null,
   WH_Desc varchar(256)         null,
   WH_Established datetime             not null,
   WH_WorkForce smallint             null,
   WH_Code varchar(10)          not null,
   constraint PK_Warehouse primary key nonclustered (WH_ID)
)
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sys.sp_addextendedproperty 'MS_Description', 
   'This is a brach office that has storage of RRV''s which are unallocated',
   'user', @CurrentUser, 'table', 'Warehouse'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'This is the ID of a warehouse',
   'user', @CurrentUser, 'table', 'Warehouse', 'column', 'WH_ID'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The name for a warehouse',
   'user', @CurrentUser, 'table', 'Warehouse', 'column', 'WH_Name'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The description for a warehouse.',
   'user', @CurrentUser, 'table', 'Warehouse', 'column', 'WH_Desc'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The date that a warehouse was established',
   'user', @CurrentUser, 'table', 'Warehouse', 'column', 'WH_Established'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The size of the workforce at a warehouse.',
   'user', @CurrentUser, 'table', 'Warehouse', 'column', 'WH_WorkForce'
go

declare @CurrentUser sysname
select @CurrentUser = user_name()
execute sp_addextendedproperty 'MS_Description', 
   'The warehouse code, a unique value used to identify the warehouse at the enterprise-wide level',
   'user', @CurrentUser, 'table', 'Warehouse', 'column', 'WH_Code'
go

alter table Allocated
   add constraint FK_Allocated_Allocated_to_Dealer_Dealer foreign key (DLR_ID)
      references Dealer (DLR_ID)
go

alter table Allocated
   add constraint FK_Allocated_ISA_RRV_RRV_Instance foreign key (RV_Serial_Number)
      references RRV_Instance (RV_Serial_Number)
go

alter table Feature
   add constraint FK_Feature_Has_Feature_FeatureSet foreign key (FS_ID)
      references FeatureSet (FS_ID)
go

alter table RRV_Instance
   add constraint FK_RRV_Instance_Has_Color_Color foreign key (CLR_ID)
      references Color (CLR_ID)
go

alter table RRV_Instance
   add constraint FK_RRV_Instance_Has_FeatureSet_FeatureSet foreign key (FS_ID)
      references FeatureSet (FS_ID)
go

alter table RRV_Instance
   add constraint FK_RRV_Instance_Has_Vehicle_Type_Vehicle_Type foreign key (VT_ID)
      references Vehicle_Type (VT_ID)
go

alter table Sold
   add constraint FK_Sold_Bought_By_Customer foreign key (CUST_ID)
      references Customer (CUST_ID)
go

alter table Sold
   add constraint FK_Sold_Dealer_Sold_Vehicle_Dealer foreign key (DLR_ID)
      references Dealer (DLR_ID)
go

alter table Sold
   add constraint FK_Sold_ISA_Allocated_Allocated foreign key (RV_Serial_Number)
      references Allocated (RV_Serial_Number)
go

alter table Sold
   add constraint FK_Sold_Using_Plan_IncentiveProgram foreign key (IP_ID)
      references IncentiveProgram (IP_ID)
go

alter table Unallocated
   add constraint FK_Unallocated_ISA_RRV2_RRV_Instance foreign key (RV_Serial_Number)
      references RRV_Instance (RV_Serial_Number)
go

alter table Unallocated
   add constraint FK_Unallocated_Stores_Unallocated_Warehouse foreign key (WH_ID)
      references Warehouse (WH_ID)
go

alter table Vehicle_Type
   add constraint FK_Vehicle_Type_VT_Has_MMC_MMC foreign key (MMC_ID)
      references MMC (MMC_ID)
go



/*
** End Script
*/
