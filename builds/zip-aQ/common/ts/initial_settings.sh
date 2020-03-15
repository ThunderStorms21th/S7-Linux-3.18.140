#!/sbin/sh
#
# ThunderStorms Initial script
#
# credits to MoRoGoKu for this nice script

ui_print "@-- Add init script"

# Remove another kernel files
rm -f /system/init.moro.rc
rm -f /system/sbin/moro_init.sh
# rm -f /system/sbin/resetprop
rm -f /system/init.spectrum.rc
# rm -f /system/init.spectrum.sh
rm -f /system/init.services.rc
# rm -f /system/init.ts.sh
# rm -f /system/sbin/spa

cp /tmp/ts/system2/init.rc /system
chmod 750 /system/init.rc

#if ! grep -q init.rc /system/init.rc; then
#  sed -i '/import \/init.moro.rc/d' /init.rc
#  sed -i '/import \/init.spectrum.rc/d' /init.rc
#  sed -i '/import \/init.ts.rc/d' /init.rc
#  sed -i '/import \/init.services.rc/d' /init.rc
#fi

# Copy kernel files
cp /tmp/ts/system2/spa /system/sbin
cp /tmp/ts/system2/init.ts.rc /system
cp /tmp/ts/system2/ts-kernel.sh /system/sbin
cp /tmp/ts/system2/init.spectrum.sh /system/sbin
cp /tmp/ts/system2/init.spectrum.rc /system
chmod 750 /system/sbin/spa
chmod 750 /system/sbin/ts-kernel.sh
chmod 750 /system/sbin/init.spectrum.sh
chmod 750 /system/init.spectrum.rc
chmod 750 /system/init.ts.rc

# Import init.ts.rc and init.spectrum.rc to init.rc
#if ! grep -q init.spectrum.rc /system/system/init.rc; then
#  sed -i '/import \/init.${ro.zygote}.rc/a import \/init.spectrum.rc' /system/system/init.rc
#fi
# if ! grep -q init.spectrum.rc /system_root/init.ts.rc; then
#  sed -i '/import \/prism\/etc\/init\/init.rc/a import \/init.ts.rc' /system_root/init.rc
# fi
#if ! grep -q init.ts.rc /system/system/init.rc; then
# sed -i '/import \/init.spectrum.rc/a import \/init.ts.rc' /system/system/init.rc
#fi

