#!/system/bin/sh

# ThunderStorm bash script for kernel and policy features settings v1.1
# Thanks to MoRoGoKu and djb77

# Set Variables
BB="/sbin/busybox"
RESETPROP="/sbin/resetprop -v -n"
TS_DIR="/data/.tskernel"
LOG="$TS_DIR/tskernel.log"

# Create ThundeRSTormS kernel folder
if [ ! -d $TS_DIR ]; then
	mkdir -p $TS_DIR;
fi

rm -f $LOG

echo $(date) "ThundeRSTormS-Kernel LOG" >> $LOG;
echo " " >> $LOG;

# Mount
mount -t rootfs -o rw,remount rootfs;
mount -o rw,remount /system;
mount -o rw,remount /data;
mount -o rw,remount /;

# Set KNOX to 0x0 on running /system
$RESETPROP ro.boot.warranty_bit "0"
$RESETPROP ro.warranty_bit "0"

# Fix Samsung Related Flags
$RESETPROP ro.fmp_config "1"
$RESETPROP ro.boot.fmp_config "1"
$RESETPROP sys.oem_unlock_allowed "0"

# Fix safetynet flags
$RESETPROP ro.boot.veritymode "enforcing"
$RESETPROP ro.boot.verifiedbootstate "green"
$RESETPROP ro.boot.flash.locked "1"
$RESETPROP ro.boot.ddrinfo "00000001"
# $RESETPROP ro.build.selinux "1"

# SELinux (0 / 640 = Permissive, 1 / 644 = Enforcing)
echo "## -- Selinux permissive" >> $LOG;
# chmod 644 /sys/fs/selinux/enforce
# setenforce 0
echo "0" > /sys/fs/selinux/enforce
chmod 640 /sys/fs/selinux/enforce
echo " " >> $LOG;

# SafetyNet
echo "## -- SafetyNet permissions" >> $LOG;
chmod 440 /sys/fs/selinux/policy
echo " " >> $LOG;

# Deepsleep fix - Tweaking logging, debugubg, tracing (@Chainfire)
echo "## -- DeepSleep Fix" >> $LOG;

dmesg -n 1 -C
echo "N" > /sys/kernel/debug/debug_enabled
echo "N" > /sys/kernel/debug/seclog/seclog_debug
echo "0" > /sys/kernel/debug/tracing/tracing_on
echo "0" > /sys/module/lowmemorykiller/parameters/debug_level
echo "0" > /sys/module/alarm_dev/parameters/debug_mask
echo "0" > /sys/module/binder/parameters/debug_mask
echo "0" > /sys/module/binder_alloc/parameters/debug_mask
echo "0" > /sys/module/powersuspend/parameters/debug_mask
echo "0" > /sys/module/xt_qtaguid/parameters/debug_mask
echo "0" > /sys/module/lowmemorykiller/parameters/debug_level
echo "0" > /sys/module/kernel/parameters/initcall_debug

if [ -f /data/adb/su/su.d/000000deepsleep ]; then
	rm -f /data/adb/su/su.d/000000deepsleep
fi

for i in `ls /sys/class/scsi_disk/`; do
	cat /sys/class/scsi_disk/$i/write_protect 2>/dev/null | grep 1 >/dev/null
	if [ $? -eq 0 ]; then
		echo 'temporary none' > /sys/class/scsi_disk/$i/cache_type
	fi
done
echo " " >> $LOG;

# Disabling unauthorized changes warnings...
echo "## -- Remove SecurityLogAgent" >> $LOG;
if [ -d /system/app/SecurityLogAgent ]; then
	rm -rf /system/app/SecurityLogAgent
fi

# Fix personalist.xml
echo "## -- Fix Personal list" >> $LOG;
if [ ! -f /data/system/users/0/personalist.xml ]; then
	touch /data/system/users/0/personalist.xml
	chmod 600 /data/system/users/0/personalist.xml
	chown system:system /data/system/users/0/personalist.xml
fi

# RMM patch (part)
echo "## -- Removing RMM" >> $LOG;
if [ -d /system/priv-app/Rlc ]; then
	rm -rf /system/priv-app/Rlc
fi

	## ThunderStormS kill Google and Media servers script
	sleep 2

	# Google play services wakelock fix
	echo "## -- GooglePlay wakelock fix $( date +"%d-%m-%Y %H:%M:%S" )" >> $LOG;
	

	# FIX GOOGLE PLAY SERVICE
	su -c "pm enable com.google.android.gms/.ads.AdRequestBrokerService"
	su -c "pm enable com.google.android.gms/.ads.identifier.service.AdvertisingIdService"
	su -c "pm enable com.google.android.gms/.ads.social.GcmSchedulerWakeupService"
	su -c "pm enable com.google.android.gms/.analytics.AnalyticsService"
	su -c "pm enable com.google.android.gms/.analytics.service.PlayLogMonitorIntervalService"
	su -c "pm enable com.google.android.gms/.backup.BackupTransportService"
	su -c "pm enable com.google.android.gms/.update.SystemUpdateActivity"
	su -c "pm enable com.google.android.gms/.update.SystemUpdateService"
	su -c "pm enable com.google.android.gms/.update.SystemUpdateService\$ActiveReceiver"
	su -c "pm enable com.google.android.gms/.update.SystemUpdateService\$Receiver"
	su -c "pm enable com.google.android.gms/.update.SystemUpdateService\$SecretCodeReceiver"
	su -c "pm enable com.google.android.gms/.thunderbird.settings.ThunderbirdSettingInjectorService"
	su -c "pm enable com.google.android.gsf/.update.SystemUpdateActivity"
	su -c "pm enable com.google.android.gsf/.update.SystemUpdatePanoActivity"
	su -c "pm enable com.google.android.gsf/.update.SystemUpdateService"
	su -c "pm enable com.google.android.gsf/.update.SystemUpdateService\$Receiver"
	su -c "pm enable com.google.android.gsf/.update.SystemUpdateService\$SecretCodeReceiver"
	echo " " >> $LOG;

# init.d
echo "## -- Remove old Init.d scripts" >> $LOG
# remove scripts
rm -f /system/etc/init.d/ts_swapoff.sh 2>/dev/null;
rm -f /system/etc/init.d/feravolt_gms.sh 2>/dev/null;
rm -f /system/etc/init.d/tskillgooogle.sh 2>/dev/null;
rm -f /system/etc/init.d/*detach* 2>/dev/null;
rm -rf /data/magisk_backup_* 2>/dev/null;

echo "## -- Start Init.d support" >> $LOG
if [ ! -d /system/etc/init.d ]; then
	mkdir -p /system/etc/init.d
fi
chown -R root.root /system/etc/init.d
chmod -R 755 /system/etc/init.d
for FILE in /system/etc/init.d/*; do
	sh $FILE >/dev/null
	echo "## -- Executing init.d script: $FILE" >> $LOG;
done;
echo "## -- End Init.d support" >> $LOG;
echo " " >> $LOG;

chmod 777 $LOG;

# Unmount
mount -t rootfs -o ro,remount rootfs;
mount -o ro,remount /system;
mount -o rw,remount /data;
mount -o ro,remount /;

