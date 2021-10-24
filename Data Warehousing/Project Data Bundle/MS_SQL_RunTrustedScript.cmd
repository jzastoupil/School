@REM ===========================================================================================================================
@REM
@REM MS_SQL_RunTrustedScript.cmd
@REM
@REM Usage: MS_SQL_RunTrustedScript SQLSERVER scriptname
@REM
@REM ===========================================================================================================================
@REM <Start Of File>

@if not exist SCRIPTS_OUT mkdir SCRIPTS_OUT
@echo started %~pnx2 %DATE%_%TIME% >> SCRIPTS_OUT\go.log
@echo ***********************************
@echo %~pnx2
@echo ***********************************
osql -S %1 -E -i %~pnx2 -w132 -e -o SCRIPTS_OUT\%~n2.out
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
@echo.      a WINDOWS AUTHENTICATED account. If that works, close this cmd shell
@echo.      then open a new one and try the makeall.cmd scrip again.
@echo.
@echo.**************************************************************************
@echo.
@pause "Please hit Control-C to Quit."

:done
@echo finished %~pnx2 >>SCRIPTS_OUT\go.log
@echo finished %~pnx2 %DATE%_%TIME% >> SCRIPTS_OUT\go.log

