@echo off
rem 当前bat的作用
 
echo ==================begin========================
 
cls
SET NGINX_PATH=E:
SET NGINX_DIR=E:\Java\nginx-1.17.4\
color 0a
TITLE Nginx 管理程序
 
CLS
 
ECHO.
ECHO. * * Nginx 管理程序 * * 
ECHO.
 
:MENU

ECHO.
ECHO. * nginx 进程list * 
tasklist|findstr /i "nginx.exe"
 
ECHO.
    ECHO.  [1] 启动Nginx 
    ECHO.  [2] 关闭Nginx 
    ECHO.  [3] 重启Nginx 
    ECHO.  [4] 退 出
ECHO.
 
ECHO.请输入选择项目的序号:
set /p ID=
    IF "%id%"=="1" GOTO start
    IF "%id%"=="2" GOTO stop
    IF "%id%"=="3" GOTO restart
    IF "%id%"=="4" EXIT
PAUSE
 
:start
    call :startNginx
    GOTO MENU
 
:stop
    call :shutdownNginx
    GOTO MENU
 
:restart
    call :shutdownNginx
    call :startNginx
    GOTO MENU
 
:shutdownNginx
    ECHO.
	ECHO.
    ECHO ================    关闭Nginx执行结果    ================
    ECHO.关闭Nginx......
    taskkill /F /IM nginx.exe > nul
    ECHO.OK,关闭所有 nginx 进程
    goto :eof
 
:startNginx
	ECHO.
	ECHO.
    ECHO ================ 启动或重启Nginx执行结果 ================
	IF "%id%"=="1"  ECHO.正在启动Nginx...... 
	IF "%id%"=="3" ECHO.正在重启Nginx......
    
    IF NOT EXIST "%NGINX_DIR%nginx.exe" ECHO "%NGINX_DIR%nginx.exe"不存在
 
    %NGINX_PATH%
 
    cd "%NGINX_DIR%"
 
    IF EXIST "%NGINX_DIR%nginx.exe" (
        echo "命令：start '' nginx.exe"
        start "" nginx.exe
    )
    IF "%id%"=="1" ECHO.OK,启动Nginx成功，正在运行......
	IF "%id%"=="3" ECHO.OK,重启Nginx成功，正在运行......
    goto :eof

	
	
	
	
	
	
	
	
	
	