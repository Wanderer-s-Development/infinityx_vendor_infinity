#!/system/bin/sh
#
# LineageOS A/B OTA Postinstall Script
#

/postinstall/system/bin/backuptool_ab.sh backup
/postinstall/system/bin/backuptool_ab.sh restore

if [ -x /postinstall/system/bin/otapreopt_script ]; then
    /postinstall/system/bin/otapreopt_script "$@"
fi

sync

exit 0
