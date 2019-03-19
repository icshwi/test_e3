


epicsEnvSet("G_TOP", "$(E3_CMD_TOP)")
epicsEnvSet("G_DEV", "GlobalDeviceName")


#iocshLoad("$(G_TOP)/1-1.iocsh", "L_T_1=$(G_TOP), L_D_1=$(G_DEV)")
$(IOCSHCMD=iocshLoad) ("$(G_TOP)/1-1.iocsh", "L_T_1=$(G_TOP), L_D_1=$(G_DEV)")

iocInit

epicsEnvSet("G_TOP", "$(E3_CMD_TOP)/../")

#-
#- Local $(L_T_1)
echo "$(L_T_1)"
#- Local $(L_D_1)
echo "$(L_D_1)"
#-
#- Local $(L_T_2)
echo "$(L_T_2)"
#- Local $(L_D_2)
echo "$(L_D_2)"
#-
#- Global TOP
echo "$(G_TOP)"
#- Global Device
echo "$(G_DEV)"
#-
#- Global TOP 1, defined in Local 1-1.iocsh
echo "$(G_TOP_1)"
#- Global DEV 1, defined in Local 1-1.iocsh
echo "$(G_DEV_1)"
#-

#- Global TOP 2, defined in Local 2-1.iocsh
echo "$(G_TOP_2)"
#- Global DEV 2, defined in Local 2-1.iocsh
echo "$(G_DEV_2)"
#-
