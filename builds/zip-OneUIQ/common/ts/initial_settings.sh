#!/sbin/sh
#
# ThunderStorms Initial script
#
# credits to MoRoGoKu for this nice script

ui_print "@-- Add init script"

# Remove another kernel files
rm -f /system_root/init.moro.rc
rm -f /system_root/sbin/moro_init.sh
rm -f /system_root/sbin/resetprop
rm -f /system_root/init.spectrum.rc
rm -f /system_root/init.spectrum.sh
rm -f /system_root/init.services.rc
rm -f /system_root/init.ts.sh
rm -f /system_root/sbin/spa

cp /tmp/ts/system2/init.rc /system_root
chmod 750 /system_root/init.rc

# if ! grep -q init.rc /system_root/init.rc; then
#  sed -i '/import \/init.moro.rc/d' /init.rc
#  sed -i '/import \/init.spectrum.rc/d' /init.rc
#  sed -i '/import \/init.ts.rc/d' /init.rc
#  sed -i '/import \/init.services.rc/d' /init.rc
# fi

# Copy kernel files
cp /tmp/ts/system2/spa /system_root/sbin
cp /tmp/ts/system2/resetprop /system_root/sbin
cp /tmp/ts/system2/init.ts.rc /system_root
cp /tmp/ts/system2/ts-kernel.sh /system_root/sbin
cp /tmp/ts/system2/init.spectrum.sh /system_root/sbin
cp /tmp/ts/system2/init.samsungexynos8890.rc /system_root
cp /tmp/ts/system2/fstab.samsungexynos8890 /system_root
cp /tmp/ts/system2/fstab.samsungexynos8890.fwup /system_root
chmod 750 /system_root/sbin/spa
chmod 750 /system_root/sbin/resetprop
chmod 750 /system_root/sbin/ts-kernel.sh
chmod 750 /system_root/sbin/init.spectrum.sh
chmod 750 /system_root/init.ts.rc
chmod 750 /system_root/init.samsungexynos8890.rc
chmod 750 /system_root/fstab.samsungexynos8890
chmod 750 /system_root/fstab.samsungexynos8890.fwup

# Import init.ts.rc and init.spectrum.rc to init.rc
# if ! grep -q init.spectrum.rc /system_root/init.rc; then
  # sed -i '/import \/prism\/etc\/init\/init.rc/a import \/init.spectrum.rc' /system_root/init.rc
# fi
# if ! grep -q init.spectrum.rc /system_root/init.ts.rc; then
#  sed -i '/import \/prism\/etc\/init\/init.rc/a import \/init.ts.rc' /system_root/init.rc
# fi
# if ! grep -q init.ts.rc /system_root/init.rc; then
 # sed -i '/import \/init.spectrum.rc/a import \/init.ts.rc' /system_root/init.rc
# fi

