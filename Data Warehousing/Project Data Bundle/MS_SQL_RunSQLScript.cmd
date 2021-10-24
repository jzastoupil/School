@REM ===========================================================================================================================
@REM
@REM MS_SQL_RunSQLScript.cmd
@REM
@REM Usage: MS_SQL_RunSQLScript SQLSERVER Usr password  scriptname
@REM
@REM ===========================================================================================================================
@REM <Start Of File>


@if not exist SCRIPTS_OUT mkdir SCRIPTS_OUT
@echo started %~nx4 %DATE%_%TIME% >> SCRIPTS_OUT\go.log
@echo ***********************************
@echo %~pnx4
@echo ***********************************
osql -S %1 -U %2 -P %3 -i %~pnx4 -w132 -e -o SCRIPTS_OUT\%~n4.out
@IF ERRORLEVEL 1 goto bad_osql
@goto done

:bad_osql
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
@echo finished %~pnx4 >>SCRIPTS_OUT\go.log
@echo finished %~pnx4 %DATE%_%TIME% >> SCRIPTS_OUT\go.log

