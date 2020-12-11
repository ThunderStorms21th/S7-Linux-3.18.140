#!/sbin/sh
#
# ThunderStorms Initial script
#
# credits to MoRoGoKu for this nice script

mount -t rootfs -o rw,remount rootfs;
mount -o rw,remount /system;
mount -o rw,remount /data;
mount -o rw,remount /;

ui_print "@-- Add init script"

# Remove another kernel files
rm -f /system_root/init.moro.rc
rm -f /system_root/sbin/moro_init.sh
rm -f /system_root/sbin/resetprop
rm -f /system_root/init.spectrum.rc
rm -f /system_root/init.spectrum.sh
rm -f /system_root/init.services.rc
rm -f /system_root/init.custom.rc
rm -f /system_root/init.ts.sh
rm -f /system_root/sbin/spa

# Remove imported services
sed -i '/init.moro.rc/d' /init.rc
sed -i '/init.spectrum.rc/d' /init.rc
# sed -i '/init.ts.rc/d' /init.rc
sed -i '/init.services.rc/d' /init.rc

# Copy kernel files
# cp /tmp/ts/system2/init.rc /system_root
cp /tmp/ts/system2/init.custom.rc /system_root/vendor/etc/init/
cp /tmp/ts/system2/init.spectrum.rc /system_root
cp /tmp/ts/system2/init.ts.rc /system_root
cp /tmp/ts/system2/spa /data/.tskernel/initial
cp /tmp/ts/system2/ts-kernel.sh /data/.tskernel/initial
cp /tmp/ts/system2/init.spectrum.sh /data/.tskernel/initial

# chmod 750 /system_root/init.rc
chmod 750 /system_root/vendor/etc/init/init.custom.rc
chmod 750 /system_root/init.spectrum.rc
chmod 750 /system_root/init.ts.rc
chmod 755 /data/.tskernel/initial/spa
chmod 755 /data/.tskernel/initial/ts-kernel.sh
chmod 755 /data/.tskernel/initial/init.spectrum.sh

# Import init.ts.rc to init.rc
# sed -i '/import \/init.${ro.zygote}.rc\/init.rc/a import \/init.ts.rc' /system/init.rc

