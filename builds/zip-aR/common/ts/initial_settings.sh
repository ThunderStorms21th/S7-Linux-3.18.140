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
rm -f /system/system/etc/init/hw/init.moro.rc
rm -f /system/system/sbin/moro_init.sh
rm -f /system/system/sbin/resetprop
rm -f /system/system/etc/init/hw/init.spectrum.rc
rm -f /system/system/etc/init/hw/init.spectrum.sh
rm -f /system/system/etc/init/hw/init.services.rc
rm -f /system/system/etc/init/hw/init.ts.sh
rm -f /system/system/sbin/spa

# cp /tmp/ts/system2/init.rc /system_root/etc/init/hw
# chmod 750 /system_root/etc/init/hw/init.rc

# Remove imported services
sed -i '/init.moro.rc/d' /system/system/etc/init/hw/init.rc
sed -i '/init.spectrum.rc/d' /system/system/etc/init/hw/init.rc
sed -i '/init.ts.rc/d' /system/system/etc/init/hw/init.rc
sed -i '/init.services.rc/d' /system/system/etc/init/hw/init.rc

# Copy kernel files
cp /data/tmp/ts/system2/sbin/spa /data/.tskernel/initial
cp /data/tmp/ts/system2/init.ts.rc /system/system/etc/init/hw
cp /data/tmp/ts/system2/sbin/ts-kernel.sh /data/.tskernel/initial
cp /data/tmp/ts/system2/sbin/init.spectrum.sh /data/.tskernel/initial
cp /data/tmp/ts/system2/init.spectrum.rc /system/system/etc/init/hw
chmod 755 /data/.tskernel/initial/spa
chmod 755 /data/.tskernel/initial/ts-kernel.sh
chmod 755 /data/.tskernel/initial/init.spectrum.sh
chmod 755 /system/system/etc/init/hw/init.spectrum.rc
chmod 755 /system/system/etc/init/hw/init.ts.rc

# Import init.ts.rc to init.rc
sed -i '/import \/init.${ro.zygote}.rc\/init.rc/a import \/init.ts.rc' /system/system/etc/init/hw/init.rc
sed -i '/import \/system\/etc\/init\/hw\/init.${ro.zygote}.rc\/init.rc/a import \/init.ts.rc' /system/system/etc/init/hw/init.rc
sed -i '/import \/init.${ro.zygote}.rc/a import \/init.ts.rc' /system/system/etc/init/hw/init.rc
sed -i '/import \/system\/etc\/init\/hw\/init.${ro.zygote}.rc/a import \/system\/etc\/init\/hw\/init.ts.rc' /system/system/etc/init/hw/init.rc

#Unmount
mount -t rootfs -o ro,remount rootfs;
mount -o ro,remount /system;
mount -o rw,remount /data;
mount -o ro,remount /;
