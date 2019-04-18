@echo off && rem

setlocal enabledelayedexpansion

set file=.\conf\zabbix_agentd.win.conf
set file_tmp=.\conf\zabbix_agentd_tmp.win.conf

set ZabbixServer=172.130.210.29

for /f "tokens=2 delims=:(" %%i in ('ipconfig /all^|find /i "ipv4"^|findstr /v 127.0.0.1') do set IPv4=%%i
set "IPv4=%IPv4: =%"

set LogFile=LogFile=C:/Program Files/zabbix/log/zabbix_agentd.log
set Server=Server=172.130.210.29
set ServerActive=ServerActive=172.130.210.29
set Hostname=Hostname=%IPv4%

echo  %LogFile%>%file%
echo  %Server%>>%file%
echo  %ServerActive%>>%file%
echo  %Hostname%>>%file% 

start .\bin\zabbix_agentd.exe -i -c .\conf\zabbix_agentd.win.conf

echo start "C:\Program Files\zabbix\bin\zabbix_agentd.exe -i -c C:\Program Files\zabbix\conf\zabbix_agentd.win.conf">%AppData%\Microsoft\Windows\Start Menu\Programs\Startup\StartRun.bat"

echo "install successfully"
