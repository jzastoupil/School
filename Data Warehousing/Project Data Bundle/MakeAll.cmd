@REM ===========================================================================================================================
@REM
@REM Make_ALL.cmd
@REM
@REM ===========================================================================================================================
@REM <Start Of File>
@REM
@REM The batch files provided are simple and do not work if there are spaces or special
@REM characters anywhere in the path
@REM

@set curr_dir=%CD%

@REM
@REM set not_goot_dir to curr_dir
@REM replace some bad chars in not_good_dir with underscored_tag
@REM compare curr_dir and not_good_dir
@REM
@REM if they are not the same then we replaced something in not_good_dir
@REM therefore we have something in curr_dir that is NOT GOOD
@REM
@setlocal ENABLEDELAYEDEXPANSION

@set "not_good_dir=%curr_dir: =__BAD_SPACE__%"
@set "not_good_dir=%not_good_dir:(=__BAD_OPEN_PAREN__%"
@set "not_good_dir=%not_good_dir:)=__BAD_CLOSE_PAREN__%"

@if NOT "%not_good_dir%"=="%curr_dir%" goto bad_dir

@if NOT exist loaddata.cmd goto bad_run

@if exist SCRIPTS_OUT rd /S /Q SCRIPTS_OUT
@if not exist SCRIPTS_OUT mkdir SCRIPTS_OUT
@echo Make_ALL.cmd was started on %DATE% at %TIME% > SCRIPTS_OUT\go.log
@cls

@if "%1"=="" goto set_sa_svr
@if "%2"=="" goto set_sa_type

@set SA_SVR=%1
@set SA_USE_TRUSTED=%2
:set_sa_svr
@if "%SA_SVR%"=="" set /P SA_SVR=Enter SQL Server: (recommended: .\GPSSQL)

@if NOT "%SA_SVR%"=="" goto set_sa_type

@echo invalid choice, SA_SVR cannot be empty, please type the name of the host/instance
@set SA_SVR=
@goto set_sa_svr
:set_sa_type
@if "%SA_USE_TRUSTED%"=="" set /P SA_USE_TRUSTED=Use [T]rusted or [S]ql authentication for sa account? enter T or S (T is recommend for school)

@if "%SA_USE_TRUSTED%"=="T" goto trusted_auth
@if "%SA_USE_TRUSTED%"=="t" goto trusted_auth
@if "%SA_USE_TRUSTED%"=="S" goto sql_auth
@if "%SA_USE_TRUSTED%"=="s" goto sql_auth

@echo invalid choice, type T or S
@set SA_USE_TRUSTED=
@goto set_sa_type
:sql_auth
@if "%SA_USR%"=="" set /P SA_USR=Enter SA Login Name: (recommended: sa)
@if "%SA_PWD%"=="" set /P SA_PWD=Enter SA Password (this will be displayed as you type it):


@call setup

@call MS_SQL_RunSQLScript.cmd %SA_SVR% %SA_USR% %SA_PWD% createLogin.ddl
@IF ERRORLEVEL 1 goto bad_SQL

@call MS_SQL_RunSQLScript.cmd %CORPORATE_SVR% %SA_USR% %SA_PWD% Corporate.sql
@IF ERRORLEVEL 1 goto bad_SQL

@call MS_SQL_RunSQLScript.cmd %SALES_ORG_SVR% %SA_USR% %SA_PWD% Sales_Org.sql
@IF ERRORLEVEL 1 goto bad_SQL

@call MS_SQL_RunSQLScript.cmd %PRODUCTS_SVR% %SA_USR% %SA_PWD% Products.sql
@IF ERRORLEVEL 1 goto bad_SQL

@call MS_SQL_RunSQLScript.cmd %STAR_SCHEMA_SVR% %SA_USR% %SA_PWD% Star_Schema.sql
@IF ERRORLEVEL 1 goto bad_SQL

@goto common

:trusted_auth
@call setup

@call MS_SQL_RunTrustedScript.cmd %SA_SVR% createLogin.ddl
@IF ERRORLEVEL 1 goto bad_SQL

@call MS_SQL_RunTrustedScript.cmd %CORPORATE_SVR% Corporate.sql
@IF ERRORLEVEL 1 goto bad_SQL

@call MS_SQL_RunTrustedScript.cmd %SALES_ORG_SVR% Sales_Org.sql
@IF ERRORLEVEL 1 goto bad_SQL

@call MS_SQL_RunTrustedScript.cmd %PRODUCTS_SVR% Products.sql
@IF ERRORLEVEL 1 goto bad_SQL

@call MS_SQL_RunTrustedScript.cmd %STAR_SCHEMA_SVR% Star_Schema.sql
@IF ERRORLEVEL 1 goto bad_SQL

@goto common

:common

@call loadData.cmd
@IF ERRORLEVEL 1 goto bad_SQL

@goto done
:bad_dir
@echo.**************************************************************************
@echo.
@echo.ERROR:    Cannot run MakeAll from a directory that has spaces in it
@echo.          or one of its parent dirs.
@echo.
@echo.          curr_dir='!curr_dir!'
@echo.
@echo.          does not match
@echo.
@echo.          not_good_dir='!not_good_dir!'
@echo.
@echo.          upzip or move the files to some other directory and try again.
@echo.
@echo.**************************************************************************
@pause "Please hit Control-C to Quit."

@goto done

:bad_run
@echo.**************************************************************************
@echo.
@echo.ERROR:    I cannot find loaddata.cmd
@echo.
@echo.          I suspect you are trying to run this from the zip file,
@echo.          you must UNZIP all the files into a directory and run
@echo.          MakeAll.cmd from that directory instead.
@echo.
@echo.**************************************************************************
@pause "Please hit Control-C to Quit."
@goto done

:bad_SQL
@echo.**************************************************************************
@echo.
@echo.ERROR:    MakeAll.cmd FAILED
@echo.
@echo.**************************************************************************
@pause "Please hit Control-C to Quit."

:done
@echo Make_ALL.cmd was FINISHED on %DATE% at %TIME% >> SCRIPTS_OUT\go.log
