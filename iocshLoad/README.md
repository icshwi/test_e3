Macro Test with iocshLoad, loadIocsh, and runScript
===


* Global Macro
In any place, if we use `epicsEnvSet`, it is the global macro after the line of the definition.  If we redefine it, from that line, we have new global macro value

```
epicsEnvSet
```

```
$ iocsh.bash IOCSHCMD=loadIocsh 1.cmd

$ iocsh.bash IOCSHCMD=runScript 1.cmd

$ iocsh.bash 1.cmd

#
iocshLoad '1.cmd',''
epicsEnvSet("G_TOP", "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad")
epicsEnvSet("G_DEV", "GlobalDeviceName")
#iocshLoad("$(G_TOP)/1-1.iocsh", "L_T_1=$(G_TOP), L_D_1=$(G_DEV)")
iocshLoad ("/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad/1-1.iocsh", "L_T_1=/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad, L_D_1=GlobalDeviceName")
#>11111111111111111111111111111111111111111111111111111111111111
#- Local epicsEnvSet
epicsEnvSet("G_TOP_1", "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad")
epicsEnvSet("G_DEV_1", "GlobalDeviceName_0")
#-
#-
#-
#- Local $(L_T_1)
echo "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad"
/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad
#- Local $(L_D_1)
echo "GlobalDeviceName"
GlobalDeviceName
#-
#- Global TOP
echo "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad"
/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad
#- Global Device
echo "GlobalDeviceName"
GlobalDeviceName
#-
#- Global TOP 1, defined in Local 1-1.iocsh
echo "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad"
/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad
#- Global DEV 1, defined in Local 1-1.iocsh
echo "GlobalDeviceName_0"
GlobalDeviceName_0
#-
#-
#-
iocshLoad ("/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad/2-1.iocsh", "L_T_2=/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad, L_D_2=GlobalDeviceName_0")
#>22222222222222222222222222222222222222222222222222222222222222
#- Local epicsEnvSet
epicsEnvSet("G_TOP_2", "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad")
epicsEnvSet("G_DEV_2", "GlobalDeviceName_0_2")
#-
#-
#-
#- Local $(L_T_2)
echo "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad"
/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad
#- Local $(L_D_2)
echo "GlobalDeviceName_0"
GlobalDeviceName_0
#-
#- Global TOP
echo "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad"
/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad
#- Global Device
echo "GlobalDeviceName"
GlobalDeviceName
#-
#- Global TOP 1, defined in Local 1-1.iocsh
echo "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad"
/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad
#- Global DEV 1, defined in Local 1-1.iocsh
echo "GlobalDeviceName_0"
GlobalDeviceName_0
#-
#- Global TOP 2, defined in Local 2-1.iocsh
echo "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad"
/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad
#- Global DEV 2, defined in Local 2-1.iocsh
echo "GlobalDeviceName_0_2"
GlobalDeviceName_0_2
#>22222222222222222222222222222222222222222222222222222222222222
#>11111111111111111111111111111111111111111111111111111111111111
iocInit
Starting iocInit
############################################################################
## EPICS R3.15.5-E3-3.15.5-patch
## EPICS Base built Mar 13 2019
############################################################################
iocRun: All initialization complete
epicsEnvSet("G_TOP", "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad/../")
#-
#- Local $(L_T_1)
macLib: macro L_T_1 is undefined (expanding string echo "$(L_T_1)")
#- Local $(L_D_1)
macLib: macro L_D_1 is undefined (expanding string echo "$(L_D_1)")
#-
#- Local $(L_T_2)
macLib: macro L_T_2 is undefined (expanding string echo "$(L_T_2)")
#- Local $(L_D_2)
macLib: macro L_D_2 is undefined (expanding string echo "$(L_D_2)")
#-
#- Global TOP
echo "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad/../"
/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad/../
#- Global Device
echo "GlobalDeviceName"
GlobalDeviceName
#-
#- Global TOP 1, defined in Local 1-1.iocsh
echo "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad"
/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad
#- Global DEV 1, defined in Local 1-1.iocsh
echo "GlobalDeviceName_0"
GlobalDeviceName_0
#-
#- Global TOP 2, defined in Local 2-1.iocsh
echo "/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad"
/home/jhlee/ics_gitsrc/verification_on_e3/iocshLoad
#- Global DEV 2, defined in Local 2-1.iocsh
echo "GlobalDeviceName_0_2"
GlobalDeviceName_0_2
#-
# Set the IOC Prompt String One 
epicsEnvSet IOCSH_PS1 "87712cc.faiserv.20775 > "



```


## Conclusion

* runScript, iocshLoad, and loadIocsh, which is the same as runScript, have the identical results.
* If we don't use `epicsEnvSet` within the transferred macron will existent only in local variables. 
* If we use `epicsEnvSet` within `iocsh` files, it will be global macron variable after this.
* If we redefine any macro variable with `epicsEnvSet`, the variable is overridden by new one from that line. 

