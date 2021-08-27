# Zabbix agent configuration

In the Zabbix agent add the following line, replace c:\zabbixdata\externalscripts with the correct location of the cmd file.

 `UserParameter=checkShare[*],C:\zabbixdata\externalscripts\testShare.cmd $1 $2 $3 $4`

# Zabbix server configuration

Load the testShare.xml template (compatible with 5.0 and higher)

Attach the template to an host

set the following macro variables

`{!HOST_IP}  IP or HOST of the fileserver`

`{!SHARE_NAME} name of the share`

`{!USERNAME} username for access to the share`

`{!PASSWORD} password for access to the share`
