# Monitor the local certificate store using Zabbix & Powershell

This template monitors certificates in the Windows local certificate store on validity and expiration date.
It uses powershell and the Zabbix active agent.

It is based on the work of [itmicus](https://github.com/itmicus/zabbix/tree/master/Template%20Windows%20Certificates). I mostly adjusted monitoring intervals.

## Features

Monitoring and LLD : get all certificates in local machine, and get days to expire certificate
Triggers for days to expire
Independent OS language
Setting configuring by User Macros

## Requirements

Windows 7 or better
Windows Server 2008R2 or better
Powershell 3 or better
Zabbix Agent Active

## Installation

### On the host
1. if not yet created, create the folders `c:\zabbixdata\externalscripts`
2. upload the powershell script to c:\zabbixdata\externalscripts
3. Search the zabbix agent configuration for the following line
    `# UnsafeUserParameters=0`
  now ensure the "#" is removed as the start of this line and set the value to "1".
  So the line should look like
    `UnsafeUserParameters=1`
4. Add the following line to the bottom of the configuration file
  `UserParameter=windows.certs[*],powershell -NoProfile -ExecutionPolicy Bypass -File "c:\zabbixdata\externalscripts\windows_certs.ps1" -ActionType "$1" -Key "$2" -Value "$3"`

### On the Zabbix Server
1. Import the template
2. Assign template to a host
