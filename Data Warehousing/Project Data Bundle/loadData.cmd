@REM    loadData
@REM    version 5.0

@REM
@REM    destroy old BCP Message log
@REM
@if "%_SKIP_LOAD_DATA_%"=="TRUE" goto done
@if exist SCRIPTS_OUT\BCP.MESSAGES.TXT del SCRIPTS_OUT\BCP.MESSAGES.TXT

@REM
@REM    Load Sales_Org Sales_Mgr
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Sales_Org Sales_Mgr>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Sales_Org..Sales_Mgr in Sales_Org\Sales_Mgr.dat -f Sales_Org\Sales_Mgr.xml -S %SALES_ORG_SVR% -U SEIS732_Team_05_Sales_Org_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Sales_Org_Sales_Mgr.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Sales_Org Metropolitan_Statistical_Area
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Sales_Org Metropolitan_Statistical_Area>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Sales_Org..Metropolitan_Statistical_Area in Sales_Org\Metropolitan_Statistical_Area.dat -f Sales_Org\Metropolitan_Statistical_Area.xml -S %SALES_ORG_SVR% -U SEIS732_Team_05_Sales_Org_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Sales_Org_Metropolitan_Statistical_Area.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Sales_Org Micropolitan_Statistical_Area
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Sales_Org Micropolitan_Statistical_Area>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Sales_Org..Micropolitan_Statistical_Area in Sales_Org\Micropolitan_Statistical_Area.dat -f Sales_Org\Micropolitan_Statistical_Area.xml -S %SALES_ORG_SVR% -U SEIS732_Team_05_Sales_Org_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Sales_Org_Micropolitan_Statistical_Area.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Sales_Org Sales_District
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Sales_Org Sales_District>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Sales_Org..Sales_District in Sales_Org\Sales_District.dat -f Sales_Org\Sales_District.xml -S %SALES_ORG_SVR% -U SEIS732_Team_05_Sales_Org_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Sales_Org_Sales_District.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Sales_Org Sales_Area
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Sales_Org Sales_Area>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Sales_Org..Sales_Area in Sales_Org\Sales_Area.dat -f Sales_Org\Sales_Area.xml -S %SALES_ORG_SVR% -U SEIS732_Team_05_Sales_Org_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Sales_Org_Sales_Area.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Sales_Org Sales_Territory
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Sales_Org Sales_Territory>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Sales_Org..Sales_Territory in Sales_Org\Sales_Territory.dat -f Sales_Org\Sales_Territory.xml -S %SALES_ORG_SVR% -U SEIS732_Team_05_Sales_Org_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Sales_Org_Sales_Territory.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Sales_Org Dealer
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Sales_Org Dealer>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Sales_Org..Dealer in Sales_Org\Dealer.dat -f Sales_Org\Dealer.xml -S %SALES_ORG_SVR% -U SEIS732_Team_05_Sales_Org_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Sales_Org_Dealer.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Corporate Department
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Corporate Department>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Corporate..Department in Corporate\Department.dat -f Corporate\Department.xml -S %CORPORATE_SVR% -U SEIS732_Team_05_Corporate_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Corporate_Department.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Corporate Website
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Corporate Website>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Corporate..Website in Corporate\Website.dat -f Corporate\Website.xml -S %CORPORATE_SVR% -U SEIS732_Team_05_Corporate_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Corporate_Website.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Corporate Owner
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Corporate Owner>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Corporate..Owner in Corporate\Owner.dat -f Corporate\Owner.xml -S %CORPORATE_SVR% -U SEIS732_Team_05_Corporate_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Corporate_Owner.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Corporate Ratings
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Corporate Ratings>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Corporate..Ratings in Corporate\Ratings.dat -f Corporate\Ratings.xml -S %CORPORATE_SVR% -U SEIS732_Team_05_Corporate_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Corporate_Ratings.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Corporate Dealership
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Corporate Dealership>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Corporate..Dealership in Corporate\Dealership.dat -f Corporate\Dealership.xml -S %CORPORATE_SVR% -U SEIS732_Team_05_Corporate_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Corporate_Dealership.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Corporate Branch
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Corporate Branch>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Corporate..Branch in Corporate\Branch.dat -f Corporate\Branch.xml -S %CORPORATE_SVR% -U SEIS732_Team_05_Corporate_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Corporate_Branch.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Corporate Plant
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Corporate Plant>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Corporate..Plant in Corporate\Plant.dat -f Corporate\Plant.xml -S %CORPORATE_SVR% -U SEIS732_Team_05_Corporate_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Corporate_Plant.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Corporate Owner_Address
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Corporate Owner_Address>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Corporate..Owner_Address in Corporate\Owner_Address.dat -f Corporate\Owner_Address.xml -S %CORPORATE_SVR% -U SEIS732_Team_05_Corporate_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Corporate_Owner_Address.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products Color
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products Color>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..Color in Products\Color.dat -f Products\Color.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_Color.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products MMC
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products MMC>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..MMC in Products\MMC.dat -f Products\MMC.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_MMC.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products FeatureSet
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products FeatureSet>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..FeatureSet in Products\FeatureSet.dat -f Products\FeatureSet.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_FeatureSet.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products Dealer
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products Dealer>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..Dealer in Products\Dealer.dat -f Products\Dealer.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_Dealer.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products Customer
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products Customer>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..Customer in Products\Customer.dat -f Products\Customer.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_Customer.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products IncentiveProgram
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products IncentiveProgram>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..IncentiveProgram in Products\IncentiveProgram.dat -f Products\IncentiveProgram.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_IncentiveProgram.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products Vehicle_Type
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products Vehicle_Type>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..Vehicle_Type in Products\Vehicle_Type.dat -f Products\Vehicle_Type.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_Vehicle_Type.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products Feature
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products Feature>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..Feature in Products\Feature.dat -f Products\Feature.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_Feature.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products Warehouse
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products Warehouse>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..Warehouse in Products\Warehouse.dat -f Products\Warehouse.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_Warehouse.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products RRV_Instance
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products RRV_Instance>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..RRV_Instance in Products\RRV_Instance.dat -f Products\RRV_Instance.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_RRV_Instance.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products Unallocated
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products Unallocated>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..Unallocated in Products\Unallocated.dat -f Products\Unallocated.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_Unallocated.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products Allocated
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products Allocated>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..Allocated in Products\Allocated.dat -f Products\Allocated.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_Allocated.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp

@REM
@REM    Load Products Sold
@REM
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo Begin BCP for Products Sold>> SCRIPTS_OUT\BCP.MESSAGES.TXT
@echo . >> SCRIPTS_OUT\BCP.MESSAGES.TXT
bcp SEIS732_Team_05_Products..Sold in Products\Sold.dat -f Products\Sold.xml -S %PRODUCTS_SVR% -U SEIS732_Team_05_Products_User -P 2017_Roll_05 -b 1000 -m 0 -e SCRIPTS_OUT\Products_Sold.err >> SCRIPTS_OUT\BCP.MESSAGES.TXT
@IF ERRORLEVEL 1 goto bad_bcp
@goto done

:bad_bcp
@echo.**************************************************************************
@echo.ERROR:
@echo.      Please Check status of the SQL Server Instance "%1"
@echo.
@echo.      You should also make sure that no files are open in the
@echo.      SCRIPTS_OUT dir and that you have adequate permissions to
@echo.      the files and directories contained in this subdirectory.
@echo.
@echo.      If there are no file permission issues, then please try to connect
@echo.      with OSQL or SQL Managment Studio to the named instance using
@echo.      a SQL AUTHENTICATED account named %2 and the password you specified.
@echo.      If that works, close this cmd shell then open a new one and try the
@echo.      makeall.cmd scrip again.
@echo.
@echo.**************************************************************************
@pause "Please hit Control-C to Quit."

:done

