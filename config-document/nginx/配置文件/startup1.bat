@echo off
rem 如果启动前已经启动nginx并记录下pid文件，会kill指定进程
nginx -s stop

rem 测试配置文件语法正确性
nginx -t -c conf/nginx.conf

rem 显示版本信息
nginx -v

rem 按照指定配置去启动nginx
nginx -c conf/nginx.conf