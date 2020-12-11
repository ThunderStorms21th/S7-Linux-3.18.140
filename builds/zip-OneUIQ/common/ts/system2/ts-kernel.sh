#!/system/bin/sh
# 
# Init TSKernel
#

BB="/sbin/busybox"
TS_DIR="/data/.tskernel"
LOG="$TS_DIR/tskernel.log"

# Mount
mount -t rootfs -o rw,remount rootfs;
mount -o rw,remount /system;
mount -o rw,remount /data;
mount -o rw,remount /;

rm -f $LOG

# Create morokernel folder
if [ ! -d $TS_DIR ]; then
	mkdir -p $TS_DIR;
fi

echo $(date) "TS-Kernel LOG" >> $LOG;
echo " " >> $LOG;

# SafetyNet
# SELinux (0 / 640 = Permissive, 1 / 644 = Enforcing)
echo "## -- SafetyNet permissions" >> $LOG;
chmod 640 /sys/fs/selinux/enforce;
chmod 440 /sys/fs/selinux/policy;
echo " " >> $LOG;

# deepsleep fix
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
echo " " >> $LOG;

# Fix personalist.xml
if [ ! -f /data/system/users/0/personalist.xml ]; then
	touch /data/system/users/0/personalist.xml;
	chmod 600 /data/system/users/0/personalist.xml;
	chown system:system /data/system/users/0/personalist.xml;
fi

## ThunderStormS kill Google and Media servers script
sleep 5

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

# Init.d support
echo "## -- Start Init.d support" >> $LOG;
if [ ! -d /system/etc/init.d ]; then
    	mkdir -p /system/etc/init.d;
fi

chown -R root.root /system/etc/init.d;
chmod 777 /system/etc/init.d;

# remove detach script
rm -f /system/etc/init.d/ts_swapoff.sh 2>/dev/null;
rm -f /system/etc/init.d/feravolt_gms.sh 2>/dev/null;
rm -f /system/etc/init.d/tskillgooogle.sh 2>/dev/null;
rm -f /system/etc/init.d/*detach* 2>/dev/null;
rm -rf /data/magisk_backup_* 2>/dev/null;

if [ "$(ls -A /system/etc/init.d)" ]; then
	chmod 777 /system/etc/init.d/*;
	for FILE in /system/etc/init.d/*; do
		echo "## -- Executing init.d script: $FILE" >> $LOG;
		sh $FILE >/dev/null;
    	done;
else
	echo "## -- No files found" >> $LOG;
fi
echo "## -- End Init.d support" >> $LOG;
echo " " >> $LOG;

chmod 777 $LOG;

# Unmount
mount -t rootfs -o ro,remount rootfs;
mount -o ro,remount /system;
mount -o rw,remount /data;
mount -o ro,remount /;

