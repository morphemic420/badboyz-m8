#!/system/bin/sh
# Startup script for MobiCore processes #

echo “MobiCore startup script called...”
# load kernel modules
insmod /system/lib/modules/mcDrvModule.ko
insmod /system/lib/modules/mcKernelApi.ko

# set device node permissions for TLC apps
chmod 777 /dev/mobicore

# TL binary folder
mkdir -p /data/app/mcRegistry

/system/bin/mcStarter

# run daemon in background
/system/bin/mcDriverDaemon
