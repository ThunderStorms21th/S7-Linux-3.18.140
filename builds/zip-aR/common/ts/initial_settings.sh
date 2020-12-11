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
rm -Rf /data/.morokernel
rm -f /system/init.moro.rc
rm -f /system/sbin/moro_init.sh
rm -f /system/sbin/resetprop
rm -f /system/init.spectrum.rc
rm -f /system/init.spectrum.sh
rm -f /system/init.services.rc
rm -f /system/init.ts.sh
rm -f /system/sbin/spa

# cp /tmp/ts/system2/init.rc /system
# chmod 755 /system/init.rc

# Remove imported services
sed -i '/init.moro.rc/d' /init.rc
sed -i '/init.spectrum.rc/d' /init.rc
# sed -i '/init.ts.rc/d' /init.rc
sed -i '/init.services.rc/d' /init.rc

# Copy kernel files
cp /data/tmp/ts/system2/sbin/spa /data/.tskernel/initial
cp /data/tmp/ts/system2/init.ts.rc /system
cp /data/tmp/ts/system2/sbin/ts-kernel.sh /data/.tskernel/initial
cp /data/tmp/ts/system2/sbin/init.spectrum.sh /data/.tskernel/initial
cp /data/tmp/ts/system2/init.spectrum.rc /system
chmod 755 /data/.tskernel/initial/spa
chmod 755 /data/.tskernel/initial/ts-kernel.sh
chmod 755 /data/.tskernel/initial/init.spectrum.sh
chmod 755 /system/init.spectrum.rc
chmod 755 /system/init.ts.rcc

# Import init.ts.rc to init.rc
sed -i '/import \/init.${ro.zygote}.rc\/init.rc/a import \/init.ts.rc' /system/init.rc

#Unmount
mount -t rootfs -o ro,remount rootfs;
mount -o ro,remount /system;
mount -o rw,remount /data;
mount -o ro,remount /;
